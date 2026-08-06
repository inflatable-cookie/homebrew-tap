class Effigy < Formula
  desc "Unified task runner for monorepos and nested workspaces"
  homepage "https://github.com/inflatable-cookie/effigy"
  license "MIT"
  version "0.9.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.9.0/effigy-aarch64-apple-darwin"
      sha256 "e68dfa238480835a55cb00a80ad336325c00b6327f1fe7b724fb929631b6325c"
    elsif Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.9.0/effigy-x86_64-apple-darwin"
      sha256 "56d9b2f61ec41fd7578533ac515b0283b41da42abb9ff6bfa73254d774be78b7"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.9.0/effigy-x86_64-unknown-linux-gnu"
      sha256 "fa0ebcce4ae47a908d5d96ca474ab1ccf1c5f2b1284909846243b3fa9ffd3a48"
    elsif Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.9.0/effigy-aarch64-unknown-linux-gnu"
      sha256 "e05aa89970bc380d77c77687b55af54ba0fb6a83e0b09d7c8e006cb2056dd9f0"
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
