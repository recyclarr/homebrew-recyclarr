# Homebrew Tap for Recyclarr

## Formula Generation

- MUST NOT hand-edit `Formula/recyclarr.rb`. It pins the latest stable release; each release
  dispatches `.github/workflows/update-formula.yml` to regenerate it from
  `Formula/recyclarr.rb.template`.
- Make formula changes in the template. They take effect at the next release, so they may target
  release contents the pinned version lacks.
- Regenerate locally with `scripts/update-formula.sh <version>`; it fetches hashes from that GitHub
  release.

## Testing

```bash
brew install --build-from-source ./Formula/recyclarr.rb
brew test recyclarr
brew audit --strict recyclarr
```
