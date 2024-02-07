# ScreensConfig

Library that contains config code for all screen types.

## Installation

Add this library to your mixfile as a git dependency.

For example:
```{:foobar, git: "https://github.com/elixir-lang/foobar.git", tag: "0.1"}```

For more check the [Mix Documentation on Dependencies](https://hexdocs.pm/mix/1.12.3/Mix.Tasks.Deps.html)

## Pulling in changes to this library in projects that use it

After you make changes to this library, you'll need to tell projects that use it to grab the updated code.

In your mix project (e.g. screens or screenplay), open up mix.exs.

1. Copy the hash of the screens-config-lib commit you want to use (probably the latest one in `main`). Paste it into the `:ref` option on the `screens_config` dep.
2. Run `mix deps.get`. The command output should show the config lib getting updated.

