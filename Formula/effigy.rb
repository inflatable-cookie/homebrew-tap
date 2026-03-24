class Effigy < Formula
  desc "Unified task runner for monorepos and nested workspaces"
  homepage "https://github.com/inflatable-cookie/effigy"
  license "MIT"
  version "0.2.12"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.2.12/effigy-aarch64-apple-darwin"
      sha256 "4ba0002960e319b2224df306e79f1a40451482f2fe701ced24f34d8ad144dd9d"
    elsif Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.2.12/effigy-x86_64-apple-darwin"
      sha256 "14d8df38eceb6a9eeaa745573bfae61a0e455329dcdbfb66e47ea969d1d28551"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.2.12/effigy-x86_64-unknown-linux-gnu"
      sha256 "6e597dc1e869b8e370d185d0a6d98ca916e0100585a5db361d0f03effdaafe52"
    elsif Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.2.12/effigy-aarch64-unknown-linux-gnu"
      sha256 "42297b904f230f93eb58f360cd32178617e0bfab5f4fe22fa7a168567861a15b"
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
