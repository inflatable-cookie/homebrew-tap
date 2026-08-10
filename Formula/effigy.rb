class Effigy < Formula
  desc "Unified task runner for monorepos and nested workspaces"
  homepage "https://github.com/inflatable-cookie/effigy"
  license "MIT"
  version "0.10.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.10.0/effigy-aarch64-apple-darwin"
      sha256 "c21aa5af489313d8f73cb4f1ff9bc4b747a1c8d43604cb7ac5655df8568a5b7f"
    elsif Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.10.0/effigy-x86_64-apple-darwin"
      sha256 "8f38923ba9d84519d9f0962dc9002be2231dc68c694885898d176ec25cda6359"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.10.0/effigy-x86_64-unknown-linux-gnu"
      sha256 "44ff4b74c1b42f9e859c5722cba5a97538ff371258761017025853a892c6f286"
    elsif Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.10.0/effigy-aarch64-unknown-linux-gnu"
      sha256 "3b73ca8a4ca6c5bbe635ae4764de9ea6200cd09fad5bc0a9c50ec0ccce0f87f6"
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
