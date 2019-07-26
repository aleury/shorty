defmodule Shorty.Links.Link do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "links" do
    field :hash, :string
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(link, attrs) do
    link
    |> cast(attrs, [:hash, :url])
    |> validate_required([:hash, :url])
    |> unique_constraint(:hash)
    |> unique_constraint(:url)
  end
end
