defmodule GodzillaCineaste.People do
  alias GodzillaCineaste.Library

  def get_person(slug) do
    Library.get_person(slug)
  end

  def list_people(search_terms \\ []) do
    Library.list_people(search_terms)
  end
end
