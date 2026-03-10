class Effigy < Formula
  desc "Unified task runner for monorepos and nested workspaces"
  homepage "https://github.com/inflatable-cookie/effigy"
  license "MIT"
  version "0.2.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.2.4/effigy-aarch64-apple-darwin"
      sha256 "cc2d6c4b50e93ae3f898c319a92f799dfba29d3072f1cbb074b7d3b9ddae85e1"
    elsif Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.2.4/effigy-x86_64-apple-darwin"
      sha256 "30c05d25bcb2a965dcab4e479c8f0767bc06955bacab10fb9804d6bca3e49baf"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.2.4/effigy-x86_64-unknown-linux-gnu"
      sha256 "53dad49560bb8ebfb26682af0dba6c4ccae76a2292a9423ae7acdb25909d3e8c"
    elsif Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.2.4/effigy-aarch64-unknown-linux-gnu"
      sha256 "8ba06f8b9089140aff9d9789e0e74cd5d941cd3523aa17eee7e25572a1e97743"
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
