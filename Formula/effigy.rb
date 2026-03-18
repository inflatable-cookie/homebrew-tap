class Effigy < Formula
  desc "Unified task runner for monorepos and nested workspaces"
  homepage "https://github.com/inflatable-cookie/effigy"
  license "MIT"
  version "0.2.10"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.2.10/effigy-aarch64-apple-darwin"
      sha256 "5597932774bf8b3be077651b5a25cffc2d60348b9449214fc549d0d18b18c365"
    elsif Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.2.10/effigy-x86_64-apple-darwin"
      sha256 "907e55591ce9c93edcb6b9822cac0e48f60b31a9597b06a4e671579d20688c55"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.2.10/effigy-x86_64-unknown-linux-gnu"
      sha256 "28068dfe3a10198a521a35a7b11224fd2ee4761b25cef5280bf46f78e37d1475"
    elsif Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.2.10/effigy-aarch64-unknown-linux-gnu"
      sha256 "50080fc7906f1d8c98b2dfabbd96c5c917ac3ed5bbe2de53916331d5652abd42"
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
