defmodule Todolist.Models.TodoItem do
  use Ecto.Schema
  use Ecto.Model

  schema "todo_items" do
    field :name, :string
    field :description, :string
    field :is_done, :boolean
    field :inserted_at, Ecto.DateTime
  end
end
