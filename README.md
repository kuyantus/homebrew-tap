# Homebrew tap for tshc

Install [tshc](https://github.com/kuyantus/tshc) with:

```sh
brew install kuyantus/tap/tshc
```

Bring your own `tsh` client, matched to the Teleport clusters you use. The formula does not install Teleport. `fzf` is optional; without it, `tshc` uses its built-in numbered selector.

On first run, `tshc` creates `~/.tshc/teleports.yaml` and asks you to edit it. Existing configuration is not replaced. For configuration and Keychain instructions, see the [project README](https://github.com/kuyantus/tshc#readme).

To update, run `brew upgrade kuyantus/tap/tshc`.
