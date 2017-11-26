defmodule Shopservices.Repo.Migrations.CreateCartItems do
  use Ecto.Migration

def change do
    create table(:cart_items, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :cart_id, references(:carts, type: :uuid, null: false)
      add :product_id, references(:products, type: :uuid, null: false)
      add :price, :decimal, precision: 12, scale: 2
      add :quantity, :decimal, precision: 12, scale: 2
      add :subtotal, :decimal, precision: 12, scale: 2

      timestamps()
    end

    create index(:cart_items, [:cart_id])
    create index(:cart_items, [:product_id])
  end

end
