Application.ensure_all_started(:hound)
ExUnit.start

{:ok, _} = Application.ensure_all_started(:ex_machina)

Ecto.Adapters.SQL.Sandbox.mode(Dango.Repo, :manual)
