defmodule Shopservices.Repo.Migrations.CreateProducts do
  use Ecto.Migration

def change do
    create table(:products, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :text
      add :description, :text
      add :image, :string
      add :unit_size, :integer
      add :unit_of_measure, :text
      add :price, :decimal, precision: 12, scale: 2

      timestamps()
    end
  end

end
