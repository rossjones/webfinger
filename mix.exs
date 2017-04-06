defmodule Webfinger.Mixfile do
  use Mix.Project

  def project do
    [app: :webfinger,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),
     description: description(),
     package: package()]
  end

  defp description() do
    """
    A simple webfinger client for querying user information
    """
  end

  defp package do
    [
     name: :webfinger,
     files: ["lib", "mix.exs", "README*", "LICENSE*"],
     maintainers: ["Ross Jones"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/rossjones/webfinger"}
   ]
  end

  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger, :httpotion]]
  end

  defp deps do
    [
     {:httpotion, "~> 3.0.2"},
     {:poison, "~> 3.1"},
     {:sweet_xml, "~> 0.6.5"},
     {:ex_doc, ">= 0.0.0", only: :dev}
   ]
  end
end
