defmodule Store.ShoppingTest do
  use ExUnit.Case
  doctest Store.Shopping

  test "greets the world" do
    assert Store.Shopping.hello() == :world
  end
end
