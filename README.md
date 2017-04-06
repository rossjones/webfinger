# Webfinger

Really simple webfinger client which attempts to handle XRD and JRD

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `webfinger` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:webfinger, "~> 0.1.0"}]
end
```

## Usage

```elixir
result_map = Webfinger.lookup("rossjones@mastodon.social")
```