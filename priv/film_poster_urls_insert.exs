alias NimbleCSV.RFC4180, as: CSV
alias CineasteData.{Film, FilmPosterUrl, Repo}

"priv/film_poster_urls_insert.csv"
|> File.read!()
|> CSV.parse_string()
|> Enum.map( fn [film_id, film_slug, image_name] ->
  image_path_name = "https://tcpyguvhxiihxcocbhoh.supabase.co/storage/v1/object/public/godzilla-cineaste-public/content/films/#{film_slug}/posters/#{image_name}"

  existing_film = Repo.get!(Film, film_id)
  poster_url = %{url: image_path_name, primary: true}

  existing_film
  |> Film.changeset(%{poster_urls: [poster_url | existing_film.poster_urls]})
  |> Repo.update!()
end)
