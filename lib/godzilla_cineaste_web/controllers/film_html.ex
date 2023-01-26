defmodule GodzillaCineasteWeb.FilmHTML do
  @moduledoc false

  use GodzillaCineasteWeb, :html

  alias CineasteData.{Film, Group, GroupRole, GroupStaff, Person, PersonRole, PersonStaff}

  def display_kaiju_roles(%Film{kaiju_roles: kaiju_roles}) when is_list(kaiju_roles) do
    kaiju_roles
    |> Enum.reduce([], fn kr, acc ->
      current_role = kr.name || kr.kaiju_character.display_name

      case acc do
        [{^current_role, krs} | rest] -> [{current_role, krs ++ [kr]} | rest]
        _ -> [{current_role, [kr]} | acc]
      end
    end)
    |> Enum.reverse()
  end

  def display_staff(%Film{group_staff: group_staff, person_staff: person_staff})
      when is_list(person_staff) and is_list(group_staff) do
    person_staff
    |> Enum.concat(group_staff)
    |> Enum.sort_by(& &1.order)
    |> Enum.reduce([], fn staff, acc ->
      current_role = staff.role

      case acc do
        [{^current_role, ss} | rest] -> [{current_role, ss ++ [staff]} | rest]
        _ -> [{current_role, [staff]} | acc]
      end
    end)
    |> Enum.reverse()
  end

  def display_roles(%Film{person_roles: person_roles, group_roles: group_roles})
      when is_list(person_roles) do
    person_roles
    |> Enum.concat(group_roles)
    |> Enum.sort_by(& &1.order)
    |> Enum.reduce([], fn role, acc ->
      current_role = role.name

      case acc do
        [{nil, rs} | rest] -> [{current_role, [role]} | acc]
        [{^current_role, rs} | rest] -> [{current_role, rs ++ [role]} | rest]
        _ -> [{current_role, [role]} | acc]
      end
    end)
    |> Enum.reverse()
  end

  def staff_display_name(%PersonStaff{person: %Person{display_name: display_name}}),
    do: display_name

  def staff_display_name(%GroupStaff{group: %Group{display_name: display_name}}), do: display_name

  def role_display_name(%PersonRole{person: %Person{display_name: display_name}}),
    do: display_name

  def role_display_name(%GroupRole{group: %Group{display_name: display_name}}), do: display_name

  def display_qualifiers(%PersonRole{qualifiers: []}), do: nil

  def display_qualifiers(%PersonRole{qualifiers: qualifiers}),
    do: "(#{Enum.join(qualifiers, ", ")})"

  def display_qualifiers(_), do: nil

  def role_is_uncredited?(%PersonRole{uncredited: true}), do: true
  def role_is_uncredited?(_), do: false

  embed_templates("film_html/*")
end
