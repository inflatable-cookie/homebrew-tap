class Effigy < Formula
  desc "Unified task runner for monorepos and nested workspaces"
  homepage "https://github.com/inflatable-cookie/effigy"
  license "MIT"
  version "0.2.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.2.6/effigy-aarch64-apple-darwin"
      sha256 "2f3801a9adb757190a3dd63ccdbdff9cfdac28b7855938d8c71c874298354844"
    elsif Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.2.6/effigy-x86_64-apple-darwin"
      sha256 "8b21ecfa9e8d1851170cec22122a2a6348839e0cebfbf57618cac8c7bd06c5a1"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.2.6/effigy-x86_64-unknown-linux-gnu"
      sha256 "a8005628d0ac5261416f00e2af8db48edc0eb2c79ea0e0a0bafa4811dd736718"
    elsif Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.2.6/effigy-aarch64-unknown-linux-gnu"
      sha256 "522e724fca6ac2f40d03d3c017ff97f6766b5ae9ed9eb02caf62e9da8f0a559e"
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
