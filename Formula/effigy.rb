class Effigy < Formula
  desc "Unified task runner for monorepos and nested workspaces"
  homepage "https://github.com/inflatable-cookie/effigy"
  license "MIT"
  version "0.2.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.2.7/effigy-aarch64-apple-darwin"
      sha256 "1494dca2350f89cc6ff5faf63a52f32be4397ee8f21b88160941a150be5aea09"
    elsif Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.2.7/effigy-x86_64-apple-darwin"
      sha256 "19b2f812f3e800390ef53901671cccc0566bb43f1480bd669512602de3020e8d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.2.7/effigy-x86_64-unknown-linux-gnu"
      sha256 "1529f245c446ee19927dc882ee2c39d718cc30a9ae580e8233d6d331b8d8645f"
    elsif Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.2.7/effigy-aarch64-unknown-linux-gnu"
      sha256 "29f73fd5cf14096aa02018f43ae05c524f608260eb23e349ba3230aef389ceaa"
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
