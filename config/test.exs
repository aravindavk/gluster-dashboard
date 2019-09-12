use Mix.Config

# Configure your database
config :gluster_dashboard, GlusterDashboard.Repo,
  username: "postgres",
  password: "postgres",
  database: "gluster_dashboard_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :gluster_dashboard, GlusterDashboardWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
