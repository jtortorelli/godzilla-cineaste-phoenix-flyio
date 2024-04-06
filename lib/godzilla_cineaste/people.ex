defmodule GodzillaCineaste.People do
  import Ecto.Query

  alias GodzillaCineaste.{Group, Person, Repo}

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
          struct: "group"
        },
        where: g.showcased,
        union_all: ^person_query

    ordered_query = from s in subquery(group_query), order_by: s.sort_name

    Repo.all(ordered_query)
  end
end
