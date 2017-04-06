defmodule Webfinger.Parser do
    import SweetXml
    alias Poison

    def parse_host_meta(obj) do
        parse(obj, namespace_conformant: true)
        |> xpath(~x"//XRD/Link/@template")
    end

    def parse_profile(obj, "application/xrd+xml" <> _rest) do
        parse(obj, namespace_conformant: true)
        |> xpath(
            ~x"//XRD"l,
            subject: ~x"./Subject/text()"S,
            aliases: ~x"./Alias/text()"sl,
            links: [
              ~x".//Link"l,
              rel: ~x"./@rel"S,
              type: ~x"./@type"S,
              href: ~x"./@href"S
            ]
        )
        |> hd
  end

    def parse_profile(obj, "application/jrd+json" <> _rest) do
        Poison.decode!(obj, keys: :atoms!)
    end
end
