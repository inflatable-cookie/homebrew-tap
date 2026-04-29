class Effigy < Formula
  desc "Unified task runner for monorepos and nested workspaces"
  homepage "https://github.com/inflatable-cookie/effigy"
  license "MIT"
  version "0.3.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.3.1/effigy-aarch64-apple-darwin"
      sha256 "40a9b192504847cfafab971601c66c375ef20c6eadf02a0b8a8b7472be9d3038"
    elsif Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.3.1/effigy-x86_64-apple-darwin"
      sha256 "11bc2f39c181d689ce8edf578b67a1a5f73f74bc656e0752d75ab92a5903a77b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.3.1/effigy-x86_64-unknown-linux-gnu"
      sha256 "7380dbdc319c0b58ca7f9b71168e12f2b66f9b626f413533d388035b70546d6e"
    elsif Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.3.1/effigy-aarch64-unknown-linux-gnu"
      sha256 "170f8e4b6587a6c1d5d98183d2ee0215801b9bfa2ab3ee74a459bd2eaef3beec"
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
