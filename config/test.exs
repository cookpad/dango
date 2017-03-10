use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :dango, Dango.Endpoint,
  http: [port: 7001],
  bcrypt: FakeBcrypt,
  server: true

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :dango, Dango.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "dango_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :hound, driver: "phantomjs", app_port: 7001
