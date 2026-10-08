class Effigy < Formula
  desc "Unified task runner for monorepos and nested workspaces"
  homepage "https://github.com/inflatable-cookie/effigy"
  license "MIT"
  version "0.14.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.14.1/effigy-aarch64-apple-darwin"
      sha256 "d18801a4c833ed36d2be205bfba79e689295b701a047d92aa0399cc2bed4e7e9"
    elsif Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.14.1/effigy-x86_64-apple-darwin"
      sha256 "b8ff990226f6ebc71e851aa6df30c5c4e8387b7236750acb42bcf8b5e1a0f9e6"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.14.1/effigy-x86_64-unknown-linux-gnu"
      sha256 "18c6e6b1626cdeafa05c97547d9da6c177825592814f837c9119980f9aa1fc34"
    elsif Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.14.1/effigy-aarch64-unknown-linux-gnu"
      sha256 "5a1f66b26b6be8962be64f07a50c4f9e2c972fa9a7e2e602c0d80432c182a859"
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
