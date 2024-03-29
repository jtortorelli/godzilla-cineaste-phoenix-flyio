alias NimbleCSV.RFC4180, as: CSV
alias GodzillaCineaste.{Film, Repo, Role}

"priv/roles_avatars.csv"
|> File.read!()
|> CSV.parse_string()
|> Enum.map(fn [role_id, film_slug, _name, _description, _person_name, _group_name, image_name] ->
  existing_role = Repo.get_by!(Role, id: role_id)
  existing_film = Repo.get_by!(Film, slug: film_slug)
  image_path_name = "https://tcpyguvhxiihxcocbhoh.supabase.co/storage/v1/object/public/godzilla-cineaste-public/content/films/#{film_slug}/cast-avatars/#{image_name}"

  # IO.inspect(image_path_name)
  existing_role
  |> Role.changeset(%{avatar_url: image_path_name})
  |> Repo.update!()
end)
