defmodule FakeBcrypt do
  def checkpw(password, password_digest) do
    "encrypted-#{password}" == password_digest
  end
end
