defmodule GodzillaCineasteWeb.AboutController do
  use GodzillaCineasteWeb, :controller

  def index(conn, _params) do
    render(conn, :index, page_title: "About")
  end

  def history(conn, _params) do
    render(conn, :history, page_title: "History")
  end

  def acknowledgements(conn, _params) do
    render(conn, :acknowledgements, page_title: "Acknowledgements")
  end
end
