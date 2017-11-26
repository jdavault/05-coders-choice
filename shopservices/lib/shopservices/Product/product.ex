defmodule Shopservices.Product do
  
  use Ecto.Schema
  import Ecto.Changeset

  alias Shopservices.CartItem

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "products" do
    field :name, :string
    field :description, :string
    field :image, :string
    field :unit_size, :integer
    field :unit_of_measure, :string
    field :price, :decimal, precision: 12, scale: 2
    has_many :cart_items, CartItem

    timestamps()
  end

  @fields ~w(name description image unit_size unit_of_measure price )

  def changeset(product, params \\ %{}) do
    product
    |> cast(params, @fields)
    |> validate_required([:name, :price])
    |> validate_number(:price, greater_than_or_equal_to: Decimal.new(0))
  end

end