<div align="center">

# GitHub Action for TODO group's Repolinter!

[![Marketplace](https://img.shields.io/badge/GitHub-Marketplace-green.svg)](https://github.com/marketplace/actions/repolinter) [![Release](https://img.shields.io/github/release/philips-labs/github-action-repolinter.svg)](https://github.com/philips-labs/github-action-repolinter/releases) ![.github/workflows/lint.yml](https://github.com/philips-labs/github-action-repolinter/workflows/.github/workflows/lint.yml/badge.svg)

This Action wraps [`repolinter`](https://github.com/todogroup/repolinter) allowing easy linting of your repository!

</div>

## Contents

- [Inputs](#inputs)
- [Environment Variables](#environment-variables)
- [Example Usage](#example-usage)
    - [Vanilla](#vanilla)
    - [Custom File](#custom-file)
- [License](#license)

## Inputs

- `args` - Optional. These are the arguments to pass to the `repolinter` CLI.

## Environment Variables

- `CUSTOM_REPOLINT_FILE` - Optional. You can override the [default configuration](./repolint.json). See [todogroup/repolinter](https://github.com/todogroup/repolinter) for more info on that.

## Example Usage

### Vanilla

`repolinter` CLI will automatically lint your repository`:

```yaml
name: Lint repository
on: [push]

jobs:
  repo-lint:
    name: "repolint"
    runs-on: ubuntu-latest
    steps:
      - name: "checkout repo"
        uses: actions/checkout@v2.0.0
        with:
          fetch-depth: 0
      - name: Test repolinter
        uses: philips-labs/github-action-repolinter@master
```

### Custom configuration file: 

Specify the configuration file:

```yaml
name: Lint repository
on: [push]

jobs:
  repo-lint-custom:
    name: "repolint custom"
    runs-on: ubuntu-latest
    steps:
      - name: "checkout repo"
        uses: actions/checkout@v2.0.0
        with:
          fetch-depth: 0
      - name: Test repolinter
        uses: philips-labs/github-action-repolinter@master
        env:
          CUSTOM_REPOLINT_FILE: repolint.json
```


### Scan external git repository 

Specify the configuration file:

```yaml
name: Lint repository
on: [push]

jobs:
  repo-lint-git:
    name: "repolint git"
    runs-on: ubuntu-latest
    steps:
      - name: Test repolinter
        uses: philips-labs/github-action-repolinter@master
        with:
          args: --git https://github.com/philips-labs/garo
```

### Scan external git repository and custom configuration

Specify the configuration file:

```yaml
name: Lint repository
on: [push]

jobs:
  repo-lint-git-custom:
    name: "repolint git custom"
    runs-on: ubuntu-latest
    steps:
      - name: "checkout repo"
        uses: actions/checkout@v2.0.0
        with:
          fetch-depth: 0
      - name: Test repolinter
        uses: philips-labs/github-action-repolinter@master
        with:
          args: --git https://github.com/philips-labs/garo
        env:
          CUSTOM_REPOLINT_FILE: repolint.json
```

#### Examples

[example repo](https://github.com/JeroenKnoops/github-action-repolinter-examples)

### Contributors

[Thanks goes to these contributors](https://github.com/philips-labs/github-action-repolinter/graphs/contributors)!

## License

[MIT License](./LICENSE)
