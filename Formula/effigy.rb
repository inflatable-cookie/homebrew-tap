class Effigy < Formula
  desc "Unified task runner for monorepos and nested workspaces"
  homepage "https://github.com/inflatable-cookie/effigy"
  license "MIT"
  version "0.12.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.12.0/effigy-aarch64-apple-darwin"
      sha256 "9621fb3c5cb08a5b8010189146ddedb21b06016b39981b2119de847c3d7f8704"
    elsif Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.12.0/effigy-x86_64-apple-darwin"
      sha256 "eba6fbf01024df65ccfacf2675fa90ebff4275be6f22f7e583c0c8eebfd8fb4a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.12.0/effigy-x86_64-unknown-linux-gnu"
      sha256 "60f7eed2e1d17f738e7b8da7b4fa9396be81c5f56cd0a765c9a23f16fefe1707"
    elsif Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.12.0/effigy-aarch64-unknown-linux-gnu"
      sha256 "a1c97f6caf874ebe362d33bc88f678de3a843bf299ffe759d78e0efd07718793"
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
