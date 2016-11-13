# Todolist

Todolist web app written with the Elixir Sugar web framework for "Exploring Elixir" tutorial videos

### Steps for Setting up the project and running it
- Create your web app with:
```terminal
mix new todolist --sup
```


- Add the Sugar dependency
```

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

```

- Configure your database to use MySql database instead of Postgres
```
```

- The Sugar framework does not create the Ecto Repo file in the location that Ecto expects,
  so to create the database from a mix command we do this:
```terminal
mix ecto.create -r Todolist.Repos.Main
```


### Steps to run the project

```
mix server
```
