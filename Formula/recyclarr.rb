class Recyclarr < Formula
  desc "CLI tool to sync TRaSH Guides to Sonarr/Radarr"
  homepage "https://github.com/recyclarr/recyclarr"
  version "8.8.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/recyclarr/recyclarr/releases/download/v#{version}/recyclarr-osx-arm64.tar.xz"
      sha256 "f1d3a0710e6c93eb1a8b740813b6771a994ca4f67f9691e84f8b2a2b113e99fe"
    end
    on_intel do
      url "https://github.com/recyclarr/recyclarr/releases/download/v#{version}/recyclarr-osx-x64.tar.xz"
      sha256 "2dc5fd9f31cd4059a2db0336d32224a72cc27e133b1290f96b2d2d557f027516"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/recyclarr/recyclarr/releases/download/v#{version}/recyclarr-linux-arm64.tar.xz"
      sha256 "0d39c3f09ed2b244af012ee4d524e3c2dbf1d2e16f8752c0cd46dbc28651968f"
    end
    on_intel do
      url "https://github.com/recyclarr/recyclarr/releases/download/v#{version}/recyclarr-linux-x64.tar.xz"
      sha256 "960fe20cf2dd1c322ca7a6395469dcbefeaa7df08b217caad7686023b840feb9"
    end
  end

  def install
    bin.install "recyclarr"
    bin.install "recyclarr-server" if version >= "9"
  end

  # v8 releases have no server binary
  if version >= "9"
    service do
      run opt_bin/"recyclarr-server"
      # Restart only after a failure; Homebrew maps `true` to systemd Restart=on-failure
      on_macos { keep_alive successful_exit: false }
      on_linux { keep_alive true }
      # The server writes its own log files; stderr keeps only crashes those files miss
      error_log_path var/"log/recyclarr.log"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/recyclarr --version")
  end
end
