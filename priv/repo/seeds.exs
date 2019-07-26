# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Shorty.Repo.insert!(%Shorty.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Shorty.Links.Link
alias Shorty.Repo

link_data = [
  %{url: "https://www.google.com"},
  %{url: "https://www.twitter.com"},
  %{url: "https://www.github.com"},
  %{url: "https://www.facebook.com"}
]

Enum.each(link_data, fn data ->
  %Link{}
  |> Link.changeset(data)
  |> Repo.insert!(on_conflict: :nothing)
end)
