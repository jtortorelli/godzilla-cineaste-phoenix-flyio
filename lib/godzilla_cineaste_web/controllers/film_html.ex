defmodule GodzillaCineasteWeb.FilmHTML do
  @moduledoc false

  use GodzillaCineasteWeb, :html

  import GodzillaCineasteWeb.CoreComponents

  alias CineasteData.{
    Film,
    Group,
    KaijuRole,
    Person,
    Role,
    Staff
  }

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

  def display_staff(%Film{staff: staff}) do
    staff
    |> Enum.reduce([], fn s, acc ->
      current_role = s.role

      case acc do
        [{^current_role, ss} | rest] -> [{current_role, ss ++ [s]} | rest]
        _ -> [{current_role, [s]} | acc]
      end
    end)
    |> Enum.reverse()
  end

  def display_roles(roles) do
    roles
    |> Enum.reduce([], fn role, acc ->
      current_role = role.name

      case acc do
        [{nil, _rs} | _rest] -> [{current_role, [role]} | acc]
        [{^current_role, rs} | rest] -> [{current_role, rs ++ [role]} | rest]
        _ -> [{current_role, [role]} | acc]
      end
    end)
    |> Enum.reverse()
  end

  def staff_display_name(%Staff{person: %Person{display_name: display_name}}),
    do: display_name

  def staff_display_name(%Staff{group: %Group{display_name: display_name}}), do: display_name

  def role_display_name(%Role{person: %Person{display_name: display_name}}),
    do: display_name

  def role_display_name(%Role{group: %Group{display_name: display_name}}), do: display_name

  def role_display_name(%KaijuRole{person: %Person{display_name: display_name}}), do: display_name
  def role_display_name(%KaijuRole{}), do: ""

  def display_qualifiers(%Role{qualifiers: []}), do: nil

  def display_qualifiers(%Role{qualifiers: qualifiers}),
    do: "(#{Enum.join(qualifiers, ", ")})"

  def display_qualifiers(_), do: nil

  def role_is_uncredited?(%Role{uncredited: true}), do: true
  def role_is_uncredited?(_), do: false

  def role_title(%Role{title: title}), do: title
  def role_title(_), do: nil

  embed_templates("film_html/*")
end
