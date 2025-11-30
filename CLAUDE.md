# Homebrew Tap for Recyclarr

Homebrew formula distribution for [recyclarr/recyclarr](https://github.com/recyclarr/recyclarr).

## Repository Purpose

Single formula tap - minimal maintenance, auto-updated by GitHub Actions on stable releases.

## Files

- `Formula/recyclarr.rb` - Generated Homebrew formula (do not edit directly)
- `Formula/recyclarr.rb.template` - Template with `{{VERSION}}` and `{{SHA_*}}` placeholders
- `scripts/update-formula.sh` - Generates formula from template with fetched hashes
- `.github/workflows/update-formula.yml` - Auto-update on release dispatch

## Local Development

Update formula locally (fetches hashes from GitHub release):

```bash
./scripts/update-formula.sh 7.5.1
```

Test the formula:

```bash
brew install --build-from-source ./Formula/recyclarr.rb
brew test recyclarr
brew audit --strict recyclarr
```

## Homebrew Resources

- [Formula Cookbook](https://docs.brew.sh/Formula-Cookbook)
- [Ruby Style Guide](https://docs.brew.sh/Formula-Cookbook#homebrew-ruby-style-guide)
