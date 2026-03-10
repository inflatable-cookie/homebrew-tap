class Effigy < Formula
  desc "Unified task runner for monorepos and nested workspaces"
  homepage "https://github.com/inflatable-cookie/effigy"
  license "MIT"
  version "0.2.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.2.3/effigy-aarch64-apple-darwin"
      sha256 "6e049ba5fd25ab72b932d7621b57de7ab90ca33caff517063101b3d8ced5d17c"
    elsif Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.2.3/effigy-x86_64-apple-darwin"
      sha256 "447f25399ef2e02579ccbf6d2648a76eb6457d0c2a183839ba35ee6d2872350c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.2.3/effigy-x86_64-unknown-linux-gnu"
      sha256 "8ca0bd3d4b1f3ba02f6f728b960ed26ec1e59df973909f51b1382374bba23f6e"
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
