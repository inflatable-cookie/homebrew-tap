class Effigy < Formula
  desc "Unified task runner for monorepos and nested workspaces"
  homepage "https://github.com/inflatable-cookie/effigy"
  license "MIT"
  version "0.8.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.3/effigy-aarch64-apple-darwin"
      sha256 "d02c0f9db2844e095a658d68d4f705643d5778dd8dc201a60a8c942c0748c45b"
    elsif Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.3/effigy-x86_64-apple-darwin"
      sha256 "27e554030d6a1ca8328587238b9ffa877e918fb434fcedc1fe233642f5567a7f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.3/effigy-x86_64-unknown-linux-gnu"
      sha256 "dca7381bca0563074ffd31fb8b14ea5071d4d8a33dbdffbe9c544dbf88bd0c2b"
    elsif Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.3/effigy-aarch64-unknown-linux-gnu"
      sha256 "357a54edbf9041d21e2d1509b1d39e94a9b860e1f41bf8d960f9959a8d33c72d"
    end
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "effigy"
  end

  test do
    assert_match "effigy", shell_output("#{bin}/effigy --help")
  end
end
