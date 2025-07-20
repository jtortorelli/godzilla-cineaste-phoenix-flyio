defmodule GodzillaCineaste.Films do
  @moduledoc false

  alias GodzillaCineaste.Library

  def get_film(slug) do
    Library.get_film(slug)
  end

  def get_film_credits(slug) do
    Library.get_film_credits(slug)
  end

  def get_film_series(slug) do
    Library.get_film_series(slug)
  end

  def list_films(search_terms \\ []) do
    Library.list_films(search_terms)
  end
end
