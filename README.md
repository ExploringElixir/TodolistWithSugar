# Todolist

Todolist web app written with the Elixir Sugar web framework for "Exploring Elixir" tutorial videos.


### Assumptions
You'll need to have Erlang and Elixir installed. You'll also need to have Postgres or MySql installed.


### Steps I took to set up the project
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

- Configure the router and server port in the config/config.exs file
Add the below code to your config/config.exs file
```
config :sugar,
  router: Todolist.Router

config :sugar, Todolist.Router,
  https_only: false,
  http: [ port: 4000 ],
  https: false
```

- Configure your database settings
The Ecto library has already been included inside the sugar dependency and so as the postgrex library so it is
expected that the database engine you are using is Postgres. However, the next step will show how to use
MySql instead. In the below code snippet replace the database connection details with yours.
```
config :todolist, ecto_repos: [Todolist.Repos.Main]

config :todolist, Todolist.Repos.Main,
  adapter: Ecto.Adapters.Postgres,
  database: "todolist",
  username: "postgres",
  password: "asdffdsa",
  hostname: "localhost"
```

- Configure your database to use MySql database instead of Postgres
In your config/config.exs file, use the below code instead of the one above. Replace the database connection details with yours.
Notice that the main thing that changed is the adapter.
```
config :todolist, ecto_repos: [Todolist.Repos.Main]

config :todolist, Todolist.Repos.Main,
  adapter: Ecto.Adapters.MySQL,
  database: "todolist",
  username: "root",
  password: "",
  hostname: "localhost"
```

In your mix.exs file, your ```deps``` should look like this:

Using ```Postgres```
```
defp deps do
  [{:sugar, "~> 0.4.10"}]
end
```

Using ```MySql```
```
defp deps do
  [{:sugar, "~> 0.4.10"},
  {:mariaex, ">= 0.6.0"}]
end
```

Then run:
```
mix deps.get
mix compile
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
mix deps.get
mix compile
mix server
```


### References
- http://sugar-framework.github.io/getting-started/
- http://geoffreylessel.com/2016/from-zero-to-ecto-in-10-minutes/
- http://www.glydergun.com/diving-into-ecto/
- https://bordeltabernacle.github.io/2016/02/12/notes-on-elixir-templating-with-eex.html
- HTML and CSS styling
  http://www.w3schools.com/howto/howto_js_todolist.asp
- https://engineering.appcues.com/2016/02/02/too-many-dicts.html
- https://github.com/elixir-ecto/ecto/wiki/Ecto-Basics
