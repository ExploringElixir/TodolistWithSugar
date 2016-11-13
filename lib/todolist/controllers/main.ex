defmodule Todolist.Controllers.Main do
  use Sugar.Controller

  def index(conn, []) do
    raw conn |> resp(200, "Todolist Home page")
  end

  def show(conn, args) do
    todo_item_id = args[:id]

    raw conn |> resp(200, "showing Todo item #{todo_item_id}")
  end

  def new(conn, []) do
    raw conn |> resp(200, "Page for adding a new todolist item")
  end

  def edit(conn, args) do
    todo_item_id = args[:id]

    %{"name" => name, "desc" => desc} = conn.params
    raw conn |> resp(200, "Page to edit todolist item: #{todo_item_id} with name: #{name}, description: #{desc}")
  end
end
