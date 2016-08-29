defmodule EvercamMedia.ControllerHelpers do
  import Plug.Conn
  import Phoenix.Controller
  alias EvercamMedia.ErrorView

  def render_error(conn, status, message) do
    conn
    |> put_status(status)
    |> render(ErrorView, "error.json", %{message: message})
  end

  def user_request_ip(conn) do
    x_real_ip = Plug.Conn.get_req_header(conn, "x-real-ip")
    x_real_ip |> List.first |> get_ip(conn)
  end

  defp get_ip(nil, conn), do: conn.remote_ip |> Tuple.to_list |> Enum.join(".")
  defp get_ip(user_ip, _conn), do: user_ip
end
