alias GodzillaCineaste.FilmSeries
alias GodzillaCineaste.Repo

"./data/series/**/*.yml"
|> Path.wildcard()
|> Enum.map(fn file ->
  yaml_map = YamlElixir.read_from_file!(file)
  slug = Path.basename(file, ".yml")

  series = Repo.get_by!(FilmSeries, slug: slug)
  changeset = Ecto.Changeset.change(series, %{document: yaml_map})
  Repo.update!(changeset)
end)
