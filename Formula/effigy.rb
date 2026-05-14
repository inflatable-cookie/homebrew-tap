class Effigy < Formula
  desc "Unified task runner for monorepos and nested workspaces"
  homepage "https://github.com/inflatable-cookie/effigy"
  license "MIT"
  version "0.7.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.7.0/effigy-aarch64-apple-darwin"
      sha256 "4b68b220ed8d2529b53cf00d2e20dc7625b346ae7a2262a35413d596b1e69833"
    elsif Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.7.0/effigy-x86_64-apple-darwin"
      sha256 "a5fb653ba88d8ecb8d05d7ca7476de53bfd71c1f96232ff68c17c734d21e7167"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.7.0/effigy-x86_64-unknown-linux-gnu"
      sha256 "f63d902ea754efab923408eea1d3111b3d7de07a936192e73b667f9c09a6162f"
    elsif Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.7.0/effigy-aarch64-unknown-linux-gnu"
      sha256 "b265337d98420b5eb9a9ed6d48ecc56fccc02d1ad77db643739b45b514fb1183"
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
