# Nix Home-Manager configuration

## Rapid home-manager deployment

```bash
# for storing nix.conf
mkdir -p ~/.config/nix/
# to be able to use flakes
echo "experimental-features = nix-command flakes" > ~/.config/nix/nix.conf
# in case you have messages with locale problems
echo "export LOCALE_ARCHIVE=/usr/lib/locale/locale-archive" >> ~/.bashrc
```

```bash
# clone repository to specific destination
git clone https://github.com/Ruhrozz/home-manager.git ~/nix/home-manager
# run home-manager without explicitly installing it
nix run home-manager/release-24.05 -- switch --flake ~/nix/home-manager/
```
