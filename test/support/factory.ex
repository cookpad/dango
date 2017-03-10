defmodule Dango.Factory do
  use ExMachina.Ecto, repo: Dango.Repo

  def user_factory do
    %Dango.User{
      email: sequence(:email, &"email-#{&1}@example.com"),
      password_digest: "encrypted-password",
      password: "password",
    }
  end
end
