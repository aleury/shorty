defmodule Shorty.Repo.Migrations.CreateLinks do
  use Ecto.Migration

  def change do
    create table(:links, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :shortcode, :string, null: false
      add :url, :string, null: false

      timestamps()
    end

    create unique_index(:links, [:shortcode])
    create unique_index(:links, [:url])
  end
end
