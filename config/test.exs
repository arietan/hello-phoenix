use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :blog_phoenix, BlogPhoenixWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :blog_phoenix, BlogPhoenix.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: System.get_env("DBUSER"),
  password: System.get_env("DBPASS"),
  database: System.get_env("DBDATABASE"),
  hostname: System.get_env("DBHOST"),
  pool: Ecto.Adapters.SQL.Sandbox
