defmodule Shopping.Repo.Migrations.CreateCart do
  use Ecto.Migration

  def change do
    create table(:carts) do
      add :name, :string
      add :description, :text
      add :product_id, references(:products, on_delete: :nothing)

      timestamps()
    end

    create index(:carts, [:product_id])
  end
end
