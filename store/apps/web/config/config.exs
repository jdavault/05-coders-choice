# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :web,
  namespace: Store.Web

# Configures the endpoint
config :web, Store.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "HxA6IeXkwrTaXidoXPZkFfXMJeW3ldLIliQmHnxE7VGT19zYVcIIKFLP5SU1nnMj",
  render_errors: [view: Store.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Store.Web.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
