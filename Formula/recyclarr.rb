class Recyclarr < Formula
  desc "CLI tool to sync TRaSH Guides to Sonarr/Radarr"
  homepage "https://github.com/recyclarr/recyclarr"
  version "8.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/recyclarr/recyclarr/releases/download/v#{version}/recyclarr-osx-arm64.tar.xz"
      sha256 "a45fb93cd9c5eb8e28380655d43d4d31ac6a3a9fd2ccb110aef8e3442fa67121"
    end
    on_intel do
      url "https://github.com/recyclarr/recyclarr/releases/download/v#{version}/recyclarr-osx-x64.tar.xz"
      sha256 "1e6585ffaa1ecc64d52d9d6302496a3a1a8dc3bd3e2a474015b6d5381f385f7f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/recyclarr/recyclarr/releases/download/v#{version}/recyclarr-linux-arm64.tar.xz"
      sha256 "90f305a7e92f3a6e63a7d5a04e03855c3b1960fd11865b21a011709c60d923fa"
    end
    on_intel do
      url "https://github.com/recyclarr/recyclarr/releases/download/v#{version}/recyclarr-linux-x64.tar.xz"
      sha256 "ac8689ca4a7ed2fdf2604ccd07453aee2aa6c44d0fc0bb9cdae37b5398956ca4"
    end
  end

  def install
    bin.install "recyclarr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/recyclarr --version")
  end
end
