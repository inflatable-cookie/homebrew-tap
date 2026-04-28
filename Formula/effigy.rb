class Effigy < Formula
  desc "Unified task runner for monorepos and nested workspaces"
  homepage "https://github.com/inflatable-cookie/effigy"
  license "MIT"
  version "0.3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.3.0/effigy-aarch64-apple-darwin"
      sha256 "5d98a8d621ea1e5a8f67c9dfafd3b55c48f18c05d27be7defee81ab12e5d30b9"
    elsif Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.3.0/effigy-x86_64-apple-darwin"
      sha256 "41429e3448c3b2b28db54eec5c81eb6d09c539912ec24bf4aee1cb8035a95a80"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.3.0/effigy-x86_64-unknown-linux-gnu"
      sha256 "8d2d71fc8ab5329a67c7d84a2606aa20aed7f9529836d56e6265c56cb292c6e6"
    elsif Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.3.0/effigy-aarch64-unknown-linux-gnu"
      sha256 "fffbf72ab9af088201134c6ce4d041eb567db228ac19153a3bf934320af96603"
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
