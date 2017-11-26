defmodule Shopping.Repo.Migrations.CreateProduct do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string
      add :description, :text

      timestamps()
    end
  end
end
