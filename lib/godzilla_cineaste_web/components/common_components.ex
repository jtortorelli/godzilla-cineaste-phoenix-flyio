defmodule GodzillaCineasteWeb.CommonComponents do
  def display_date(date_string) when is_binary(date_string) do
    date_string |> Date.from_iso8601!() |> Calendar.strftime("%-d %b %Y")
  end
end
