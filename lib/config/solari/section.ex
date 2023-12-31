defmodule ScreensConfig.Solari.Section do
  @moduledoc false

  alias ScreensConfig.Query
  alias ScreensConfig.Solari.Section.{Audio, Headway, Layout}

  @type t :: %__MODULE__{
          name: String.t(),
          arrow: :n | :e | :s | :w | :ne | :se | :sw | :nw | nil,
          query: Query.t(),
          layout: Layout.t(),
          audio: Audio.t(),
          pill: :bus | :red | :orange | :green | :blue | :cr | :mattapan | :silver,
          headway: Headway.t()
        }

  @enforce_keys [:name, :pill]
  defstruct name: nil,
            arrow: nil,
            query: Query.from_json(:default),
            layout: Layout.from_json(:default),
            audio: Audio.from_json(:default),
            pill: nil,
            headway: Headway.from_json(:default)

  use ScreensConfig.Struct,
    children: [query: Query, layout: Layout, audio: Audio, headway: Headway]

  for arrow <- ~w[n e s w ne se sw nw]a do
    arrow_string = Atom.to_string(arrow)

    defp value_from_json("arrow", unquote(arrow_string)) do
      unquote(arrow)
    end
  end

  for pill <- ~w[bus red orange green blue cr mattapan silver]a do
    pill_string = Atom.to_string(pill)

    defp value_from_json("pill", unquote(pill_string)) do
      unquote(pill)
    end
  end

  defp value_from_json(_, value), do: value

  defp value_to_json(_, value), do: value
end
