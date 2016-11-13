defmodule Todolist.Models.TodoItem do
  use Ecto.Schema
  use Ecto.Model
  import Ecto.Changeset

  schema "todo_items" do
    field :name, :string
    field :description, :string
    field :is_done, :boolean
    field :inserted_at, Ecto.DateTime
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :description, :is_done, :inserted_at])
  end
end
