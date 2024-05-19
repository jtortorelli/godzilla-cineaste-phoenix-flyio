defmodule GodzillaCineaste.People do
  import Ecto.Query

  alias GodzillaCineaste.{
    Film,
    Group,
    PartialDate,
    Person,
    PersonAlternateName,
    Place,
    Repo,
    Role,
    Staff
  }

  def list_people(_search_term \\ nil) do
    person_query =
      from p in Person,
        select: %{
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

    Repo.all(ordered_query)
  end

  def get_person_by_slug!(slug) do
    Repo.get_by!(Person, slug: slug)
  end

  def get_group_by_slug!(slug) do
    Repo.get_by!(Group, slug: slug)
  end

  def get_entity_by_slug!(slug) do
    with nil <- Repo.get_by(Person, slug: slug) do
      Repo.get_by!(Group, slug: slug)
    end
  end

  def build_cards(%Person{} = person) do
    [
      build_birth_card(person),
      build_role_cards(person),
      build_death_card(person)
    ]
    |> List.flatten()
    |> Enum.sort_by(& &1.date, Date)
  end

  def build_cards(_), do: []

  defp build_birth_card(%Person{} = person) do
    if Person.has_birth_date?(person) do
      %PersonAlternateName{name: name, japanese_name: japanese_name} =
        Person.birth_name(person)

      [
        %{
          type: :birth,
          date: PartialDate.initialize_date(person.dob),
          birth_name: name,
          japanese_birth_name: japanese_name,
          birth_date: PartialDate.display_date(person.dob),
          birth_place: Place.display_place(person.birth_place)
        }
      ]
    else
      []
    end
  end

  defp build_death_card(%Person{} = person) do
    if Person.has_death_date?(person) || Person.unknown_death_date?(person) do
      {date, death_date} =
        if Person.has_death_date?(person) do
          {PartialDate.initialize_date(person.dod), PartialDate.display_date(person.dod)}
        else
          {Timex.now(), "Unknown Date"}
        end

      [
        %{
          type: :death,
          date: date,
          death_date: death_date,
          death_place: Place.display_place(person.death_place),
          age: Person.age(person)
        }
      ]
    else
      []
    end
  end

  defp build_role_cards(%Person{} = person) do
    %Person{roles: roles, staff: staff} = Repo.preload(person, roles: :film, staff: :film)

    (roles ++ staff)
    |> Enum.group_by(& &1.film_id)
    |> Enum.map(fn {_k, v} -> build_role_card(v) end)
  end

  defp build_role_card(values) do
    [%{film: %Film{} = film} | _] = values

    %{roles: roles, staff: staff} =
      values
      |> Enum.reduce(%{staff: [], roles: []}, fn
        %Role{} = v, acc -> Map.put(acc, :roles, [v | acc.roles])
        %Staff{} = v, acc -> Map.put(acc, :staff, [v | acc.staff])
      end)
      |> Enum.map(fn {k, v} -> {k, Enum.sort_by(v, & &1.order)} end)
      |> Enum.into(%{})

    %{
      type: :film,
      date: film.release_date,
      film_title: film.title,
      film_release_date: Film.display_release_date(film),
      film_poster_url: Film.primary_poster_url(film),
      roles: roles,
      staff: staff
    }
  end
end
