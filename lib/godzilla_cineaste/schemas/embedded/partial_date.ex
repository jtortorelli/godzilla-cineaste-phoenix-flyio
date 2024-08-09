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

  def diff_from_now(%__MODULE__{} = partial_date) do
    Timex.diff(Timex.now(), initialize_date(partial_date), :years)
  end

  def diff(%__MODULE__{} = start_date, %__MODULE__{} = end_date) do
    Timex.diff(initialize_date(end_date), initialize_date(start_date), :years)
  end

  def display_date_range(from, to) do
    case {from, to} do
      {nil, _} -> nil
      {%{year: nil}, _} -> nil
      {%{year: year}, %{year: nil, unknown: true}} -> "#{year}-?"
      {%{year: year}, nil} -> "#{year}-Present"
      {%{year: year}, %{year: to_year}} -> "#{year}-#{to_year}"
    end
  end
end
