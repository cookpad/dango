defmodule Dango.Feature.UserSignsOutTest do
  use Dango.FeatureCase

  describe "User signs out" do
    it "successfully", %{conn: conn} do
      navigate_to page_path(conn, :index, as: insert(:user))

      click_role "sign-out"

      refute role_visible?("sign-out")
    end
  end
end
