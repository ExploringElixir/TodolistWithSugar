defmodule Todolist.Mixfile do
  use Mix.Project

  def project do
    [app: :todolist,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger],
     mod: {Todolist, []}]
  end

  defp deps do
    [{:sugar, "~> 0.4.10"}]
  end
end
