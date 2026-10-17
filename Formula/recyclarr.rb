class Recyclarr < Formula
  desc "CLI tool to sync TRaSH Guides to Sonarr/Radarr"
  homepage "https://github.com/recyclarr/recyclarr"
  version "8.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/recyclarr/recyclarr/releases/download/v#{version}/recyclarr-osx-arm64.tar.xz"
      sha256 "72eec30657609fa026eb58cefd4dd131ae377019efd73804c1c7c7b0cb88e51d"
    end
    on_intel do
      url "https://github.com/recyclarr/recyclarr/releases/download/v#{version}/recyclarr-osx-x64.tar.xz"
      sha256 "cc3f19a691ca3556dab963e3bca70ea9f2bada71a0a4202096666894b256778f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/recyclarr/recyclarr/releases/download/v#{version}/recyclarr-linux-arm64.tar.xz"
      sha256 "0c25a7d050222f4f04ebc11ab6fe96c9622eb6330205b498e586fa96674cb1ad"
    end
    on_intel do
      url "https://github.com/recyclarr/recyclarr/releases/download/v#{version}/recyclarr-linux-x64.tar.xz"
      sha256 "2cb3dec46e722d092bc683725e4cd59fe0407bb82381ce4c8316446b0b918754"
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
