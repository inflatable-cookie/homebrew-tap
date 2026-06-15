class Effigy < Formula
  desc "Unified task runner for monorepos and nested workspaces"
  homepage "https://github.com/inflatable-cookie/effigy"
  license "MIT"
  version "0.8.14"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.14/effigy-aarch64-apple-darwin"
      sha256 "c690306ff66654e8c4ce0de233d1d568ca4a8b8462d42b906e1d8fc874cc4625"
    elsif Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.14/effigy-x86_64-apple-darwin"
      sha256 "d83c6ec43ae309ef65fd7601ece498496e1dfc452ab4a65c7379d20313889b29"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.14/effigy-x86_64-unknown-linux-gnu"
      sha256 "033af69df9a7f0c2c07d5ab28d3142c354f29375d92bc377ce0a1c9f2ef0e8de"
    elsif Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.14/effigy-aarch64-unknown-linux-gnu"
      sha256 "321b23359a6b4cf2a83e05ff238e9a5a7a04ab99c04d4af281b723dcaab3b232"
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
