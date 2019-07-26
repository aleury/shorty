defmodule ShortyWeb.RedirectController do
  use ShortyWeb, :controller

  alias Shorty.Links

  action_fallback ShortyWeb.FallbackController

  @spec show(Plug.Conn.t(), map) :: Plug.Conn.t()
  def show(conn, %{"shortcode" => shortcode}) do
    with {:ok, link} <- Links.get_link_by_shortcode(shortcode) do
      redirect(conn, external: link.url)
    end
  end
end
