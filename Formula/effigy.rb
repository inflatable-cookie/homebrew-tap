class Effigy < Formula
  desc "Unified task runner for monorepos and nested workspaces"
  homepage "https://github.com/inflatable-cookie/effigy"
  license "MIT"
  version "0.4.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.4.0/effigy-aarch64-apple-darwin"
      sha256 "ae1c090c926360002d47cac264006f054c86f0c660dd045dc49d08545ae5e4cb"
    elsif Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.4.0/effigy-x86_64-apple-darwin"
      sha256 "570ff41842f86d855ee0e22194d890fbd0322fed548ecfa6fe674b714fe10cab"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.4.0/effigy-x86_64-unknown-linux-gnu"
      sha256 "08b2f61b377920145ea3fe0fffac42d83a88ced604aa3311c394a97022705f77"
    elsif Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.4.0/effigy-aarch64-unknown-linux-gnu"
      sha256 "d3c3a48f3030dbb8178279ce5e8a8d4defe918391699fa07e0eb1e71ef9492ef"
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
