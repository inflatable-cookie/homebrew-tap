class Effigy < Formula
  desc "Unified task runner for monorepos and nested workspaces"
  homepage "https://github.com/inflatable-cookie/effigy"
  license "MIT"
  version "0.12.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.12.1/effigy-aarch64-apple-darwin"
      sha256 "b41d3af312c8b48acc185eee3795d48ba11248bca8d599ba7c5f717e59f6d6ee"
    elsif Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.12.1/effigy-x86_64-apple-darwin"
      sha256 "e68c1d537dcf777e69dc46a02bbdcc04a10142268ba7bc06b862941e27f2fbb8"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.12.1/effigy-x86_64-unknown-linux-gnu"
      sha256 "7125cf919dbaca5880b3b32a36385a50d5525f47b902ea31dcd82cac79373863"
    elsif Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.12.1/effigy-aarch64-unknown-linux-gnu"
      sha256 "c4f8f95eda040ac5b986f3b40e17bda003686a3cd6094c38a17a0726957f3982"
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
