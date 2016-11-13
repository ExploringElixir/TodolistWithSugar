defmodule Todolist.Router do
  use Sugar.Router
  plug Sugar.Plugs.HotCodeReload

  if Sugar.Config.get(:sugar, :show_debugger, false) do
    use Plug.Debugger, otp_app: :todolist
  end

  plug Plug.Static, at: "/static", from: :todolist

  # Uncomment the following line for session store
  # plug Plug.Session, store: :ets, key: "sid", secure: true, table: :session

  # Define your routes here
  get "/", Todolist.Controllers.Main, :index
  get "/new", Todolist.Controllers.Main, :new
  get "/show/:id", Todolist.Controllers.Main, :show
  post "/edit/:id", Todolist.Controllers.Main, :edit

end
