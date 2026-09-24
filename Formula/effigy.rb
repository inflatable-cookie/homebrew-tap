class Effigy < Formula
  desc "Unified task runner for monorepos and nested workspaces"
  homepage "https://github.com/inflatable-cookie/effigy"
  license "MIT"
  version "0.13.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.13.0/effigy-aarch64-apple-darwin"
      sha256 "1001de1279ced3575a0f44b884e84e5592d6c0a8755b606bced9b031ed8f121b"
    elsif Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.13.0/effigy-x86_64-apple-darwin"
      sha256 "0f9e49acb0418721de1d0dfa6500b70f56ac100563be88d04b8507396c2ad30d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.13.0/effigy-x86_64-unknown-linux-gnu"
      sha256 "c2bb3b615c765502c244cdc45e112ab91653396c0869a759da337d2300e73df4"
    elsif Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.13.0/effigy-aarch64-unknown-linux-gnu"
      sha256 "9cae04feccbfc981b4c867a4d0f81ee51a141c1189e9361e9f1cb5a83332fbdc"
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
