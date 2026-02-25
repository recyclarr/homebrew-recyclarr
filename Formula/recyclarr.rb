class Recyclarr < Formula
  desc "CLI tool to sync TRaSH Guides to Sonarr/Radarr"
  homepage "https://github.com/recyclarr/recyclarr"
  version "8.3.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/recyclarr/recyclarr/releases/download/v#{version}/recyclarr-osx-arm64.tar.xz"
      sha256 "e3362c48be46b72f038b842f1f7d112a5f777d0f14e79fc4eac3ec276d712923"
    end
    on_intel do
      url "https://github.com/recyclarr/recyclarr/releases/download/v#{version}/recyclarr-osx-x64.tar.xz"
      sha256 "b29132541f2ab69b9a4f040b7b3fa820edd65eaf4a9cdb715f9dce670e13cb51"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/recyclarr/recyclarr/releases/download/v#{version}/recyclarr-linux-arm64.tar.xz"
      sha256 "5500c90573d446af4b7e8a0ecc77859795a9de02b8b74f34fe1ee989337712f6"
    end
    on_intel do
      url "https://github.com/recyclarr/recyclarr/releases/download/v#{version}/recyclarr-linux-x64.tar.xz"
      sha256 "0e4dcc45a070ea3f8e54148d9d64605cdbaf216ede6f1582e8b5bd8b55f73f3f"
    end
  end

  def install
    bin.install "recyclarr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/recyclarr --version")
  end
end
