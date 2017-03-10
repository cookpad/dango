defmodule Dango.FeatureCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      use ExSpec, async: false
      use Hound.Helpers

      alias Dango.Repo
      import Ecto
      import Ecto.Changeset
      import Ecto.Query, only: [from: 1, from: 2]

      import Dango.Gettext
      import Dango.Router.Helpers
      import Dango.Factory
      import Dango.FeatureHelpers

      @endpoint Dango.Endpoint
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Dango.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Dango.Repo, {:shared, self()})
    end

    Hound.start_session

    {:ok, conn: Phoenix.ConnTest.build_conn}
  end
end
