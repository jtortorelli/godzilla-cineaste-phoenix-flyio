defmodule GodzillaCineaste.People do
  import Ecto.Query

  alias GodzillaCineaste.{
    Film,
    Group,
    KaijuRole,
    Person,
    Repo,
    Role,
    Staff,
    Work
  }

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
    with nil <- Repo.get_by(Person, slug: slug) do
      Repo.get_by!(Group, slug: slug) |> Repo.preload(:members)
    end
  end

  def get_selected_filmography_by_entity!(%Person{id: person_id}) do
    role_subquery = from(r in Role, where: r.person_id == ^person_id, select: r.film_id)
    staff_subquery = from(s in Staff, where: s.person_id == ^person_id, select: s.film_id)

    kaiju_role_subquery =
      from(kr in KaijuRole, where: kr.person_id == ^person_id, select: kr.film_id)

    author_subquery =
      from(w in Work,
        join: f in assoc(w, :films),
        join: a in assoc(w, :authors),
        where: a.id == ^person_id,
        select: f.id
      )

    assocs = [
      staff: from(s in Staff, where: s.person_id == ^person_id, order_by: s.order),
      roles: from(r in Role, where: r.person_id == ^person_id, order_by: r.order),
      kaiju_roles: from(kr in KaijuRole, where: kr.person_id == ^person_id, order_by: kr.order),
      works: from(w in Work, join: a in assoc(w, :authors), where: a.id == ^person_id)
    ]

    Film
    |> from(as: :film)
    |> where(
      [film: f],
      f.id in subquery(role_subquery) or f.id in subquery(staff_subquery) or
        f.id in subquery(kaiju_role_subquery) or f.id in subquery(author_subquery)
    )
    |> order_by([film: f], f.release_date)
    |> preload(^assocs)
    |> Repo.all()
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

    person = "person"

    where(
      query,
      [s],
      ilike(fragment("unaccent(?)", s.display_name), fragment("unaccent(?)", ^search_term)) or
        (s.struct == ^person and s.id in subquery(alternate_name_subquery))
    )
  end
end
