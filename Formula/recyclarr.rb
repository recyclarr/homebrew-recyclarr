class Recyclarr < Formula
  desc "CLI tool to sync TRaSH Guides to Sonarr/Radarr"
  homepage "https://github.com/recyclarr/recyclarr"
  version "8.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/recyclarr/recyclarr/releases/download/v#{version}/recyclarr-osx-arm64.tar.xz"
      sha256 "cfdb28ecc26686230642c16f646fd7227d3c4fcf250362fe2e12e98bbf82144d"
    end
    on_intel do
      url "https://github.com/recyclarr/recyclarr/releases/download/v#{version}/recyclarr-osx-x64.tar.xz"
      sha256 "3daeae42defacd3f18013e8f4243fdb3b69fc287dcb97b17ddbc2484d88b26c4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/recyclarr/recyclarr/releases/download/v#{version}/recyclarr-linux-arm64.tar.xz"
      sha256 "612536e6ed36cc2d363966f20eb8d8c96ea266c042db3e1fcb729a150bf0b8a8"
    end
    on_intel do
      url "https://github.com/recyclarr/recyclarr/releases/download/v#{version}/recyclarr-linux-x64.tar.xz"
      sha256 "c85a312756bda5616a68e071648aadbc1759126b79bb381a8ddf2670077b9c56"
    end
  end

  def install
    bin.install "recyclarr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/recyclarr --version")
  end
end
