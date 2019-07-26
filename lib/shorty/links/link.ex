defmodule Shorty.Links.Link do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "links" do
    field :shortcode, :string
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(link, attrs) do
    link
    |> cast(attrs, [:url])
    |> validate_required([:url])
    |> put_shortcode()
    |> unique_constraint(:shortcode)
    |> unique_constraint(:url)
  end

  @spec put_shortcode(Ecto.Changeset.t()) :: Ecto.Changeset.t()
  def put_shortcode(changeset) do
    case fetch_change(changeset, :url) do
      :error -> changeset
      {:ok, url} -> put_change(changeset, :shortcode, generate_shortcode(url))
    end
  end

  @spec generate_shortcode(binary) :: binary
  def generate_shortcode(url) when is_binary(url) do
    :crypto.hash(:md5, url)
    |> Base.encode64()
    |> String.replace(~r/\//, "_")
    |> String.replace(~r/\+/, "-")
    |> String.slice(0, 6)
  end
end
