defmodule Shopservices.Cart do
  
  use Ecto.Schema
  import Ecto.Changeset

  alias Shopservices.{CartItem, Repo}

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "carts" do
    field :customer, :string
    field :amount, :decimal, precision: 12, scale: 2
    field :date, :date
    has_many :cart_items, CartItem, on_delete: :delete_all

    timestamps()
  end

  @fields ~w(customer amount date)

  def changeset(data, params \\ %{}) do
    data
    |> cast(params, @fields)
    |> validate_required([:customer, :date])
  end


end
