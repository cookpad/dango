# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :dango,
  ecto_repos: [Dango.Repo]

# Configures the endpoint
config :dango, Dango.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "jljWdat/g0IRaoopKaIR2lzkN7lvammu/6PWMjCP3E9SZxrHvRAyn10m0vgQjwRF",
  render_errors: [view: Dango.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Dango.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
