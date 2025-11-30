# Homebrew Tap for Recyclarr

Homebrew formula distribution for [recyclarr/recyclarr](https://github.com/recyclarr/recyclarr).

## Repository Purpose

Single formula tap - minimal maintenance, auto-updated by GitHub Actions on stable releases.

## Files

- `Formula/recyclarr.rb` - Homebrew formula (Ruby DSL)
- `.github/workflows/update-formula.yml` - Auto-update on release dispatch

## Formula Updates

Triggered via `workflow_dispatch` from main recyclarr repo. Manual updates:

```bash
# Calculate SHA256 for a release
curl -sL "https://github.com/recyclarr/recyclarr/releases/download/v{VERSION}/recyclarr-{ARCH}.tar.xz" | sha256sum
```

## Testing

```bash
brew install --build-from-source ./Formula/recyclarr.rb
brew test recyclarr
brew audit --strict recyclarr
```

## Homebrew Resources

- [Formula Cookbook](https://docs.brew.sh/Formula-Cookbook)
- [Ruby Style Guide](https://docs.brew.sh/Formula-Cookbook#homebrew-ruby-style-guide)
