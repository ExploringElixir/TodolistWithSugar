defmodule Todolist.Repos.Main.Migrations.TodoItems do
  use Ecto.Migration

  def change do
    create table(:todo_items) do
      add :name, :string
      add :description, :string, default: ""
      add :is_done, :boolean, default: false
      add :inserted_at, :datetime
    end
  end
end
