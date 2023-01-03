defmodule GodzillaCineasteWeb.FilmHTML do
  @moduledoc false

  use GodzillaCineasteWeb, :html

  alias CineasteData.Film

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

  def display_staff(%Film{person_staff: person_staff}) when is_list(person_staff) do
    person_staff
    |> Enum.reduce([], fn ps, acc ->
      current_role = ps.role

      case acc do
        [{^current_role, pss} | rest] -> [{current_role, pss ++ [ps]} | rest]
        _ -> [{current_role, [ps]} | acc]
      end
    end)
    |> Enum.reverse()
  end

  embed_templates "film_html/*"
end
