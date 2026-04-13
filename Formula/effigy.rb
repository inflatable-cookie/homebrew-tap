class Effigy < Formula
  desc "Unified task runner for monorepos and nested workspaces"
  homepage "https://github.com/inflatable-cookie/effigy"
  license "MIT"
  version "0.2.13"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.2.13/effigy-aarch64-apple-darwin"
      sha256 "5319a1208d6ca999115f0327ce0022b481e78367a5da973d2db10d865424b939"
    elsif Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.2.13/effigy-x86_64-apple-darwin"
      sha256 "1ead426e3e5fac9876a343853976a0250e0b08749752dabbb69d656f29249dbd"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.2.13/effigy-x86_64-unknown-linux-gnu"
      sha256 "b84c037f880c9e88a58457917acdd950215918a43538a62952fbf08fdf4cd08e"
    elsif Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.2.13/effigy-aarch64-unknown-linux-gnu"
      sha256 "f3734ebc6b237d6829bf0a9efe0812e2541afd5864bbec65d00c66c4b1b23d6f"
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
