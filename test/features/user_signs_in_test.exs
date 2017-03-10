defmodule Dango.Feature.UserSignsInTest do
  use Dango.FeatureCase

  describe "User signs in" do
    it "successfully" do
      user = insert(:user, password_digest: "encrypted-password")
      navigate_to "/"

      click_role "sign-in"

      fill_in(:session, :email, user.email)
      fill_in(:session, :password, "password")
      submit("session")

      assert role_visible?("sign-out")
    end
  end
end
