defmodule GodzillaCineaste.PartialDate do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :year, :integer
    field :month, :integer
    field :day, :integer
    field :unknown, :boolean
  end

  def changeset(partial_date, attrs) do
    cast(partial_date, attrs, [:year, :month, :day, :unknown])
  end

  def initialize_date(%__MODULE__{year: year, month: month, day: day}) do
    Date.new!(year, month || 1, day || 1)
  end

  def display_date(%__MODULE__{year: year, month: nil, day: nil}) do
    year
  end

  def display_date(%__MODULE__{year: year, month: month, day: nil}) do
    "#{Timex.month_shortname(month)} #{year}"
  end

  def display_date(%__MODULE__{year: year, month: month, day: day}) do
    Date.new!(year, month, day) |> Timex.format!("{D} {Mshort} {YYYY}")
  end

  def display_date(%__MODULE__{}), do: nil
end
