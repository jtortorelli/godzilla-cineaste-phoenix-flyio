defmodule GodzillaCineasteWeb.FilmHTML do
  @moduledoc false

  use GodzillaCineasteWeb, :html

  import GodzillaCineasteWeb.FilmComponents

  embed_templates("film_html/*")
end
