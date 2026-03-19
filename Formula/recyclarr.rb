class Recyclarr < Formula
  desc "CLI tool to sync TRaSH Guides to Sonarr/Radarr"
  homepage "https://github.com/recyclarr/recyclarr"
  version "8.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/recyclarr/recyclarr/releases/download/v#{version}/recyclarr-osx-arm64.tar.xz"
      sha256 "31adb0c3d546fff7279120cae378dece26cddc97b8eeae4fb97214f35f5ab769"
    end
    on_intel do
      url "https://github.com/recyclarr/recyclarr/releases/download/v#{version}/recyclarr-osx-x64.tar.xz"
      sha256 "1a46651dbf029b1cdbde3e9b6bf214047f92b089ef5ccabc7f61f74099c5525e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/recyclarr/recyclarr/releases/download/v#{version}/recyclarr-linux-arm64.tar.xz"
      sha256 "3e5054407399ffffae649b35b4ef9605a011094e48b3a08f66dd54bc329f881d"
    end
    on_intel do
      url "https://github.com/recyclarr/recyclarr/releases/download/v#{version}/recyclarr-linux-x64.tar.xz"
      sha256 "35706bddfb89e4d2e8641db6e0b229470b05a76c827efc294c8d0c26c50f58be"
    end
  end

  def install
    bin.install "recyclarr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/recyclarr --version")
  end
end
