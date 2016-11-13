# Todolist

Todolist web app written with the Elixir Sugar web framework for "Exploring Elixir" tutorial videos

### Steps for Setting up the project and running it
- Create your web app with:
```terminal
mix new todolist --sup
```


- Add the Sugar dependency
```
defp deps do
  [{:sugar, "~> 0.4.10"}]
end
```

- Get the Sugar dependencies
```
mix deps.get
mix compile
```

- Initialize the app as a sugar web app
```terminal
mix sugar.init
```

- Configure your database settings and server port in the config/config.exs file
The Ecto library has already been included inside the sugar dependency and so as the postgrex library so it is
expected that the database engine you are using is Postgres. However, the next step will show how to use
MySql instead
```
config :todolist, ecto_repos: [Todolist.Repos.Main]

config :todolist, Todolist.Repos.Main,
  adapter: Ecto.Adapters.Postgres,
  database: "todolist_dev",
  username: "postgres",
  password: "asdffdsa",
  hostname: "localhost"




config :sugar,
  router: Todolist.Router

config :sugar, Todolist.Router,
  https_only: false,
  http: [ port: 4000 ],
  https: false
```

- Configure your database to use MySql database instead of Postgres
```

```

- The Sugar framework does not create the Ecto Repo file in the location that Ecto expects,
  so to create the database from a mix command we do this:
```terminal
mix ecto.create -r Todolist.Repos.Main
```

- Create database schema migration file for creating the "todo_items" table
```terminal
mix ecto.gen.migration todo_items -r Todolist.Repos.Main
```

- Run all schema migrations that need to be run
```
mix ecto.migrate -r Todolist.Repos.Main
```

- To test your database setup from the Elixir REPL:
Start the REPL like so:
```terminal
iex -S mix
```

Now, manually add one row to the 'todo_items' table then do this at the REPL:
```terminal
Todolist.Repos.Main.all Todolist.Models.TodoItem
```


### Steps to run the project

```
mix server
```
