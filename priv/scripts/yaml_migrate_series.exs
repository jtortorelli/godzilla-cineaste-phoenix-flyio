film_series =
  GodzillaCineaste.Repo.all(GodzillaCineaste.FilmSeries)
  |> GodzillaCineaste.Repo.preload(entries: :film)

Enum.each(film_series, fn series ->
  yaml = %{
    name: series.name,
    entries:
      Enum.map(series.entries, fn entry ->
        %{
          title: entry.film.title,
          year: entry.film.release_date.year,
          slug: entry.film.slug,
          entry_number: entry.entry_number
        }
      end)
  }

  yaml
  |> Ymlr.document!()
  |> then(&File.write!("data/series/#{series.slug}.yml", &1))
end)
