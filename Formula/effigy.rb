class Effigy < Formula
  desc "Unified task runner for monorepos and nested workspaces"
  homepage "https://github.com/inflatable-cookie/effigy"
  license "MIT"
  version "0.8.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.1/effigy-aarch64-apple-darwin"
      sha256 "5d0e315d5868ddbafffc95db3dc130549709f00e71f054140500e0fc1a2cde58"
    elsif Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.1/effigy-x86_64-apple-darwin"
      sha256 "54d611a636383805c09c7cd13aa06f53dc1bffd2daa54481f52d9505538219b1"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.1/effigy-x86_64-unknown-linux-gnu"
      sha256 "a6fa05a880fd3ac427ba2fde509f2fac29db391c73cd3c0b635f3429b8991c92"
    elsif Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.1/effigy-aarch64-unknown-linux-gnu"
      sha256 "def45c539e000d12eb90060244e3d1f8e27d96e7539965c8be47cdc5aebd0aa0"
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
