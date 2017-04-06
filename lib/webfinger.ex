defmodule Webfinger do
  @moduledoc """
  Webfinger client to discover information about people or other
  entities on the Internet that are identified by a URI.
  """
  alias Webfinger.Parser


  def lookup(uri) do
    response = host_meta(uri)
    |> to_string
    |> String.replace("{uri}", URI.encode(uri))
    |> HTTPotion.get(follow_redirects: true)

    Parser.parse_profile(response.body, response.headers["content-type"])
  end


  def host_meta(uri) do
    HTTPotion.get("https://#{get_host(uri)}/.well-known/host-meta", follow_redirects: true)
    |> _query_url()
  end

  def _query_url(%HTTPotion.ErrorResponse{message: _}) do
    ""
  end

  def _query_url(%HTTPotion.Response{} = response) do
    Parser.parse_host_meta(response.body)
    |> to_string
  end


  def get_host(uri) do
    uri
    |> String.split("@")
    |> Enum.reverse
    |> hd
  end




end
