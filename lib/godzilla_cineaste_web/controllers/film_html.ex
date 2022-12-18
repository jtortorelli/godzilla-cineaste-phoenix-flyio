defmodule GodzillaCineasteWeb.FilmHTML do
  use GodzillaCineasteWeb, :html

  alias GodzillaCineaste.Film

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
