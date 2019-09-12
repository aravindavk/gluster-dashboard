defmodule GlusterDashboard.Repo do
  use Ecto.Repo,
    otp_app: :gluster_dashboard,
    adapter: Ecto.Adapters.Postgres
end
