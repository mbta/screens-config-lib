%{
  configs: [
    %{
      name: "default",
      requires: ["lib/screens-config-lib/checks/**/*.ex"],
      files: %{
        included: ["lib/", "test/"],
        excluded: []
      },
      checks: [
        # Disable some checks enabled by default
        {Credo.Check.Design.AliasUsage, false},
        {Credo.Check.Refactor.CyclomaticComplexity, false},
        {Credo.Check.Refactor.Nesting, false}
      ]
    }
  ]
}
