class Effigy < Formula
  desc "Unified task runner for monorepos and nested workspaces"
  homepage "https://github.com/inflatable-cookie/effigy"
  license "MIT"
  version "0.8.16"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.16/effigy-aarch64-apple-darwin"
      sha256 "a127d1810388c57204388ca45070627a1bddf1e6454b150544c109719f953bc4"
    elsif Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.16/effigy-x86_64-apple-darwin"
      sha256 "6e1cb6f61b1f751d8d1d360c7dc07258b810c704f313fc88598c2e191242e5f3"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.16/effigy-x86_64-unknown-linux-gnu"
      sha256 "a1911d562beb493dcc345b77abb61bd31da5e2d5dba3be148cbf5c4fbc1697c0"
    elsif Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.16/effigy-aarch64-unknown-linux-gnu"
      sha256 "24c44c37f106c02f25dd73984a02ff60a76e9b2ab5a37fd5423a011b82509fa8"
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
