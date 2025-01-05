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

  def display_date(%__MODULE__{year: year, month: month, day: nil} = date)
      when is_integer(year) and is_integer(month) do
    date |> initialize_date() |> Calendar.strftime("%b %Y")
  end

  def display_date(%__MODULE__{year: year, month: month, day: day} = date)
      when is_integer(year) and is_integer(month) and is_integer(day) do
    date |> initialize_date() |> Calendar.strftime("%-d %b %Y")
  end

  def display_date(%__MODULE__{}), do: nil

  def diff_from_now(%__MODULE__{} = partial_date) do
    partial_date
    |> initialize_date()
    |> then(&Date.diff(Date.utc_today(), &1))
    |> div(365)
  end

  def diff(%__MODULE__{} = start_date, %__MODULE__{} = end_date) do
    start_date = initialize_date(start_date)
    end_date = initialize_date(end_date)

    end_date
    |> Date.diff(start_date)
    |> div(365)
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
