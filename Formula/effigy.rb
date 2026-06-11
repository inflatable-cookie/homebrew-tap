class Effigy < Formula
  desc "Unified task runner for monorepos and nested workspaces"
  homepage "https://github.com/inflatable-cookie/effigy"
  license "MIT"
  version "0.8.13"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.13/effigy-aarch64-apple-darwin"
      sha256 "e776d65800324b8212100965cd363e59e366cb7b0ddd971aa7176bedab585d3e"
    elsif Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.13/effigy-x86_64-apple-darwin"
      sha256 "089823d66d100552563b1b9cf97a58deb629341af7dd428399c6321f2abbab70"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.13/effigy-x86_64-unknown-linux-gnu"
      sha256 "181df7dde55c08ab09ad4d579ae3f045753635e7dc41f9e394b8b9bd0b4a1929"
    elsif Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.13/effigy-aarch64-unknown-linux-gnu"
      sha256 "0bc21582521dd60e8f4d9eb85b69aa47a2fe44946f2c440caae02d27cda1f4f8"
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
