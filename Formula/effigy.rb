class Effigy < Formula
  desc "Unified task runner for monorepos and nested workspaces"
  homepage "https://github.com/inflatable-cookie/effigy"
  license "MIT"
  version "0.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.2.0/effigy-aarch64-apple-darwin"
      sha256 "ecc224eb93f417661844e43110add7ed78f24619b2f2140cc828bbd3a30ed8b1"
    elsif Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.2.0/effigy-x86_64-apple-darwin"
      sha256 "f32024482bf91a967c11baa557439f17d60bd66fc90bfe30c157e72bb3b1d2cb"
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
