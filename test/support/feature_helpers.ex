defmodule Dango.FeatureHelpers do
  use Hound.Helpers

  def fill_in(form_name, field_name, value) do
    fill_field({:name, "#{form_name}[#{field_name}]"}, value)
  end

  def click_role(role_name) do
    role_name
    |> role_element
    |> click
  end

  def role_element(role_name) do
    {:css, "[data-role=#{role_name}]"}
  end

  def role_visible?(role_name) do
    element?(:css, "[data-role=#{role_name}]")
  end

  def submit(role) do
    click_role("submit-#{role}")
  end
end
