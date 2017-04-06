defmodule WebfingerTest do
  use ExUnit.Case
  alias Webfinger

  doctest Webfinger

  test "get host" do
    assert Webfinger.get_host("rossjones@mastodon.social") == "mastodon.social"
  end

  test "get host meta" do
    assert Webfinger.host_meta("gmail.com") ==
        "https://profiles.google.com/_/webfinger/?q={uri}"
  end

  test "lookup xrd" do
    p = Webfinger.lookup("rossdjones@gmail.com")
    assert p.subject == "acct:rossdjones@gmail.com"
  end

  test "lookup jrd" do
    p = Webfinger.lookup("rossjones@mastodon.social")
    assert p.subject == "acct:rossjones@mastodon.social"
  end

end
