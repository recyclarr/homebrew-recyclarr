class Recyclarr < Formula
  desc "CLI tool to sync TRaSH Guides to Sonarr/Radarr"
  homepage "https://github.com/recyclarr/recyclarr"
  version "7.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/recyclarr/recyclarr/releases/download/v#{version}/recyclarr-osx-arm64.tar.xz"
      sha256 "fc5196b60b9dc6d09125a1c080b34a8c11808f08032c11446184b5f9412f853c"
    end
    on_intel do
      url "https://github.com/recyclarr/recyclarr/releases/download/v#{version}/recyclarr-osx-x64.tar.xz"
      sha256 "14827c3192b53406077363c66cf540fe6289618d07c59b78a0e2b49ee05721ab"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/recyclarr/recyclarr/releases/download/v#{version}/recyclarr-linux-arm64.tar.xz"
      sha256 "c19a35f24b22211405c85023a8e8c9d9c47b2dc5b8c8d58539ca9589f7bc3f8d"
    end
    on_intel do
      url "https://github.com/recyclarr/recyclarr/releases/download/v#{version}/recyclarr-linux-x64.tar.xz"
      sha256 "f13623e27c3affad34baa0f282e19ad13101c90f26d5ec967c5a23b09fe365e9"
    end
  end

  def install
    bin.install "recyclarr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/recyclarr --version")
  end
end
