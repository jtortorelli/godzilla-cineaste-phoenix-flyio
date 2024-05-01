defmodule GodzillaCineaste.People do
  import Ecto.Query
  alias GodzillaCineaste.{Group, PartialDate, Person, Repo}

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
      build_birth_card(person)
    ]
    |> List.flatten()
    |> Enum.sort_by(& &1.date, Date)
  end

  defp build_birth_card(%Person{} = person) do
    if Person.has_birth_date?(person) do
      [
        %{
          type: :birth,
          date: PartialDate.initialize_date(person.dob),
          birth_name: Person.birth_name(person),
          birth_date: PartialDate.display_date(person.dob),
          birth_place: Person.display_birth_place(person)
        }
      ]
    else
      []
    end
  end
end
