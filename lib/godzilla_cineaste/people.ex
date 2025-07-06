defmodule GodzillaCineaste.People do
  import Ecto.Query

  alias GodzillaCineaste.{
    AwardNomination,
    Film,
    Group,
    KaijuRole,
    Library,
    Person,
    Repo,
    Role,
    Staff,
    TVSeries,
    TVSeriesMainCast,
    TVSeriesMainStaff,
    Work
  }

  def get_person(slug) do
    Library.get_person(slug)
  end

  def list_people do
    Library.list_people()
  end

  def list_people(search_term \\ nil) do
    person_query =
      from p in Person,
        select: %{
          id: p.id,
          slug: p.slug,
          display_name: p.display_name,
          sort_name: p.sort_name,
          avatar_url: p.avatar_url,
          dob: p.dob,
          dod: p.dod,
          profession: p.profession,
          struct: "person"
        },
        where: p.showcased

    group_query =
      from g in Group,
        select: %{
          id: g.id,
          slug: g.slug,
          display_name: g.display_name,
          sort_name: g.sort_name,
          avatar_url: g.avatar_url,
          dob: nil,
          dod: nil,
          profession: g.profession,
          struct: "group"
        },
        where: g.showcased,
        union_all: ^person_query

    ordered_query = from s in subquery(group_query), order_by: s.sort_name

    ordered_query |> maybe_filter_by_search_term(search_term) |> Repo.all()
  end

  def get_person_by_slug!(slug) do
    Repo.get_by!(Person, slug: slug)
  end

  def get_group_by_slug!(slug) do
    Repo.get_by!(Group, slug: slug)
  end

  def get_entity_by_slug!(slug) do
    with nil <-
           Repo.get_by(Person, slug: slug) |> Repo.preload(relationships: [:relative], trivia: []) do
      Repo.get_by!(Group, slug: slug) |> Repo.preload(:members)
    end
  end

  def get_accolades_by_entity!(%Person{id: person_id}) do
    query =
      from(nominations in AwardNomination,
        join: people in assoc(nominations, :people),
        join: films in assoc(nominations, :films),
        join: category in assoc(nominations, :category),
        join: ceremony in assoc(category, :ceremony),
        where: people.id == ^person_id,
        order_by: [films.release_date, ceremony.held_at, category.order]
      )

    preloads = [:films, category: [ceremony: :award]]

    query |> preload(^preloads) |> Repo.all()
  end

  def get_accolades_by_entity!(%Group{}), do: []

  def get_selected_filmography_by_entity!(%Person{id: person_id}) do
    role_subquery = from(r in Role, where: r.person_id == ^person_id, select: r.film_id)
    staff_subquery = from(s in Staff, where: s.person_id == ^person_id, select: s.film_id)

    tv_main_cast_subquery =
      from(tvmc in TVSeriesMainCast,
        where: tvmc.person_id == ^person_id,
        select: tvmc.tv_series_id
      )

    tv_main_staff_subquery =
      from(tvms in TVSeriesMainStaff,
        where: tvms.person_id == ^person_id,
        select: tvms.tv_series_id
      )

    kaiju_role_subquery =
      from(kr in KaijuRole, where: kr.person_id == ^person_id, select: kr.film_id)

    author_subquery =
      from(w in Work,
        join: f in assoc(w, :films),
        join: a in assoc(w, :authors),
        where: a.id == ^person_id,
        select: f.id
      )

    film_assocs = [
      staff: from(s in Staff, where: s.person_id == ^person_id, order_by: s.order),
      roles: from(r in Role, where: r.person_id == ^person_id, order_by: r.order),
      kaiju_roles: from(kr in KaijuRole, where: kr.person_id == ^person_id, order_by: kr.order),
      works: from(w in Work, join: a in assoc(w, :authors), where: a.id == ^person_id)
    ]

    tv_series_assocs = [
      main_cast:
        from(tvmc in TVSeriesMainCast, where: tvmc.person_id == ^person_id, order_by: tvmc.order),
      main_staff:
        from(tvms in TVSeriesMainStaff, where: tvms.person_id == ^person_id, order_by: tvms.order)
    ]

    films =
      Film
      |> from(as: :film)
      |> where(
        [film: f],
        f.id in subquery(role_subquery) or f.id in subquery(staff_subquery) or
          f.id in subquery(kaiju_role_subquery) or f.id in subquery(author_subquery)
      )
      |> order_by([film: f], f.release_date)
      |> preload(^film_assocs)
      |> Repo.all()

    tv_series =
      TVSeries
      |> from(as: :tv_series)
      |> where(
        [tv_series: tvs],
        tvs.id in subquery(tv_main_cast_subquery) or tvs.id in subquery(tv_main_staff_subquery)
      )
      |> order_by([tv_series: tvs], tvs.first_air_date)
      |> preload(^tv_series_assocs)
      |> Repo.all()

    mapper = fn
      %Film{release_date: release_date} -> release_date
      %TVSeries{first_air_date: first_air_date} -> first_air_date
    end

    Enum.sort_by(films ++ tv_series, mapper, Date)
  end

  def get_selected_filmography_by_entity!(%Group{id: group_id}) do
    role_subquery = from(r in Role, where: r.group_id == ^group_id, select: r.film_id)
    staff_subquery = from(s in Staff, where: s.group_id == ^group_id, select: s.film_id)

    assocs = [
      staff: from(s in Staff, where: s.group_id == ^group_id, order_by: s.order),
      roles: from(r in Role, where: r.group_id == ^group_id, order_by: r.order),
      kaiju_roles: from(kr in KaijuRole, where: false),
      works: from(w in Work, where: false)
    ]

    Film
    |> from(as: :film)
    |> where([film: f], f.id in subquery(role_subquery) or f.id in subquery(staff_subquery))
    |> order_by([film: f], f.release_date)
    |> preload(^assocs)
    |> Repo.all()
  end

  defp maybe_filter_by_search_term(query, nil), do: query

  defp maybe_filter_by_search_term(query, search_term) do
    alternate_name_subquery =
      Person
      |> from()
      |> join(:cross, [p], a in fragment("jsonb_array_elements(?)", p.alternate_names))
      |> where([p, a], fragment("unaccent(? ->> 'name') ilike unaccent(?)", a, ^search_term))
      |> select([p, a], p.id)

    group_member_subquery =
      Group
      |> from()
      |> join(:left, [g], p in assoc(g, :members))
      |> join(:cross, [g, m], a in fragment("jsonb_array_elements(?)", m.alternate_names))
      |> where(
        [g, m, a],
        ilike(fragment("unaccent(?)", m.display_name), fragment("unaccent(?)", ^search_term)) or
          fragment("unaccent(? ->> 'name') ilike unaccent(?)", a, ^search_term)
      )
      |> select([g, m, a], g.id)

    person = "person"

    group = "group"

    where(
      query,
      [s],
      ilike(fragment("unaccent(?)", s.display_name), fragment("unaccent(?)", ^search_term)) or
        (s.struct == ^person and s.id in subquery(alternate_name_subquery)) or
        (s.struct == ^group and s.id in subquery(group_member_subquery))
    )
  end
end
