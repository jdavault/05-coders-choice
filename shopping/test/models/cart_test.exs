defmodule Shopping.CartTest do
  use Shopping.ModelCase

  alias Shopping.Cart

  @valid_attrs %{description: "some description", name: "some name"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Cart.changeset(%Cart{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Cart.changeset(%Cart{}, @invalid_attrs)
    refute changeset.valid?
  end
end
