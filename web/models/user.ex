defmodule Dango.User do
  use Dango.Web, :model

  schema "users" do
    field :email
    field :password_digest
    field :password, :string, virtual: true

    timestamps()
  end

  @required_fields [
    :email,
    :password,
  ]

  @permitted_fields @required_fields

  def changeset(model, params \\ :invalid) do
    model
    |> cast(params, @permitted_fields)
    |> unique_constraint(:email)
    |> validate_required(@required_fields)
    |> validate_format(:email, ~r/@/)
  end
end
