defmodule Shopservices.CartItem do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "cart_items" do
    belongs_to :cart, Shopservices.Cart, type: :binary_id
    belongs_to :product, Shopservices.Product, type: :binary_id
    field :quantity, :decimal, precision: 12, scale: 2
    field :price, :decimal, precision: 12, scale: 2
    field :subtotal, :decimal, precision: 12, scale: 2

    timestamps()
  end

  @fields ~w(product_id price quantity)
  @zero Decimal.new(0)

  def changeset(data, params \\ %{}) do
    data
    |> cast(params, @fields)
    #|> validate_required([:product_id, :price, :quantity])
    |> validate_number(:price, greater_than_or_equal_to: @zero)
    #|> validate_number(:quantity, greater_than_or_equal_to: @zero)
    |> foreign_key_constraint(:cart_id, message: "Select a valid invoice")
    |> foreign_key_constraint(:product_id, message: "Select a valid item")
    |> set_subtotal
  end

  def set_subtotal(cs) do
    case {(cs.changes[:price] || cs.data.price), (cs.changes[:quantity] || cs.data.quantity)} do
      {_price, nil} -> cs
      {nil, _quantity} -> cs
      {price, quantity} ->
        put_change(cs, :subtotal, Decimal.mult(price, quantity))
    end
  end
end