defmodule Todolist.Controllers.Main do
  use Sugar.Controller
  alias Todolist.Repos.Main, as: EctoRepo
  alias Todolist.Models.TodoItem

  require Ecto.DateTime
  require Logger


  def index(conn, []) do
    # raw conn |> resp(200, "Todolist Home page")
    all_todo_items = TodoItem |> EctoRepo.all

    conn |> render(:index, all_todo_items: all_todo_items)
  end

  def new(conn, []) do
    conn |> render(:new)
  end

  def create(conn, []) do
    %{"name" => task_name, "description" => task_desc} = conn.params
    item_insert_result = EctoRepo.insert %TodoItem{name: task_name, description: task_desc,
        is_done: false, inserted_at: Ecto.DateTime.from_erl(:erlang.localtime)}

    case item_insert_result do
      {:ok, new_item} ->
        index(conn, [])
      {:error, reason} ->
        IO.inspect "Error in creating todo item! #{reason}"
    end
  end


  def edit(conn, args) do
    todo_item_id = args[:id]
    todo_item = TodoItem |> EctoRepo.get(todo_item_id)

    conn |> render(:edit, [todo_item: todo_item])
  end

  def update(conn, args) do
    todo_item_id = args[:id]

    case Integer.parse todo_item_id do
      {id_val, _} ->
        %{"name" => task_name, "description" => task_desc} = conn.params
        todo_item = TodoItem |> EctoRepo.get(id_val)

        todo_item_change_set = TodoItem.changeset(todo_item, %{name: task_name, description: task_desc})
        EctoRepo.update!(todo_item_change_set)

        index(conn, [])
      :error ->
        raw conn |> resp(200, "[Update todo item] Invalid id: #{todo_item_id}")
    end
  end

  def delete(conn, args) do
      todo_item_id = args[:id]

      case Integer.parse todo_item_id do
        {id_val, _} ->
          todo_item = TodoItem |> EctoRepo.get(id_val)

          EctoRepo.delete(todo_item)
          index(conn, [])
        :error ->
          raw conn |> resp(200, "[Delete todo item] Invalid id: #{todo_item_id}")
      end
  end
end
