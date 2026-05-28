class Effigy < Formula
  desc "Unified task runner for monorepos and nested workspaces"
  homepage "https://github.com/inflatable-cookie/effigy"
  license "MIT"
  version "0.8.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.5/effigy-aarch64-apple-darwin"
      sha256 "c967450251ce1292aba5f5e5342eef9cc76835897b3f67a1945c096c2340d242"
    elsif Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.5/effigy-x86_64-apple-darwin"
      sha256 "3bb56d51be648023b9d0132dc8edd1c14b7a2ac7a4a491088ecf59c48e12cd58"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.5/effigy-x86_64-unknown-linux-gnu"
      sha256 "9dfbe5241e0d915de31fe1f610d28a5a74091cbd76409598737b0923dc0b971c"
    elsif Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.5/effigy-aarch64-unknown-linux-gnu"
      sha256 "d73f35c25bb24011f8d098fbf5dbd2b1f18787e3140669317284e897e2274532"
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
