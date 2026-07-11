# homebrew-tap
A homebrew tap for Zenith's projects &amp; other modding tools.

## Usage

```sh
# Add the tap
brew tap zenith-team/tap

# Install casks (Example: Pyamoto)
brew install pyamoto
```

## Maintaining

To update a formula after a new release, update the `version` and `sha256` in `Casks/*.rb`:

Use the `update.sh` utility to do so:
```sh
./update.sh <cask_name> <new_version_tag>

# Example (Pyamoto)
./update.sh pyamoto 1.0.1
```
