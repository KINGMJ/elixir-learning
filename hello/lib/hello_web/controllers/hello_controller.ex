defmodule HelloWeb.HelloController do
  use HelloWeb, :controller
  import Plug.Conn

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def show(conn, %{"messenger" => messenger} = params) do
    ## render(conn, "show.html", messenger: messenger)
    ## text(conn, "From messenger #{messenger}")
    ## json(conn, %{id: messenger})

    html(conn, """
      <html>
        <head>
          <title>Passing a Messenger</title>
        </head>
        <body>
          <p>From messenger #{messenger}</p>
        </body>
      </html>
    """)
  end

  # def show(conn, params) do
  #   conn
  #   |> assign(:messenger, messenger)
  #   |> assign(:receiver, receiver)
  #   |> render("show.html")
  # end

end
