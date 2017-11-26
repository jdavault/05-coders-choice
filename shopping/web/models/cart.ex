defmodule Shopping.Cart do
  use Shopping.Web, :model

  schema "carts" do
    field :name, :string
    field :description, :string
    #belongs_to :products, Shopping.Product

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :description])
    |> validate_required([:name, :description])
  end
end
