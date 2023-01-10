defmodule GodzillaCineasteWeb.FilmHTML do
  @moduledoc false

  use GodzillaCineasteWeb, :html

  alias CineasteData.{Film, Group, GroupStaff, Person, PersonStaff}

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

  def staff_display_name(%PersonStaff{person: %Person{display_name: display_name}}),
    do: display_name

  def staff_display_name(%GroupStaff{group: %Group{display_name: display_name}}), do: display_name

  embed_templates "film_html/*"
end
