class Effigy < Formula
  desc "Unified task runner for monorepos and nested workspaces"
  homepage "https://github.com/inflatable-cookie/effigy"
  license "MIT"
  version "0.7.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.7.1/effigy-aarch64-apple-darwin"
      sha256 "2a532626e02b66fcb179e686ea804c47c693c418962dc254b8f37c5fc1f69c73"
    elsif Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.7.1/effigy-x86_64-apple-darwin"
      sha256 "f48211a4e7aadf8e36e0daf125a18d886d9761da36615a3e087d88f4a511b62a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.7.1/effigy-x86_64-unknown-linux-gnu"
      sha256 "33baafc9c59c1465f2d57f3d67daee7957a1be9ca44cd51b962c956380349385"
    elsif Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.7.1/effigy-aarch64-unknown-linux-gnu"
      sha256 "8f1b14f2858f4f124de435fcff8ae7db045634426cfc4cdc6271d783905c11be"
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
