class Effigy < Formula
  desc "Unified task runner for monorepos and nested workspaces"
  homepage "https://github.com/inflatable-cookie/effigy"
  license "MIT"
  version "0.8.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.9/effigy-aarch64-apple-darwin"
      sha256 "9e6d05cfbf4d2dea30cad2783a35abc4b70e4c9fad98c3b640307d9bfed07192"
    elsif Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.9/effigy-x86_64-apple-darwin"
      sha256 "954cdebadd2588a3b4f964a44454e2e49b352fe4bb4a537618f4f36e20dbb3d3"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.9/effigy-x86_64-unknown-linux-gnu"
      sha256 "d25f283d845b02398d9240d8eb3d14732c5d0ce18351cc67541b9ccae051679a"
    elsif Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.9/effigy-aarch64-unknown-linux-gnu"
      sha256 "fe3c47071257bef7cc8d30f77dc8c4baeee1659d3919ed47e231c59d021926b0"
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
