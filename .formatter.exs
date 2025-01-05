[
  import_deps: [:ecto, :ecto_sql, :phoenix],
  subdirectories: ["priv/*/migrations", "priv/scripts"],
  plugins: [Phoenix.LiveView.HTMLFormatter],
  inputs: [
    "*.{heex,ex,exs}",
    "priv/*/seeds.exs",
    "priv/scripts/*.exs",
    "{config,lib,test}/**/*.{heex,ex,exs}"
  ]
]
