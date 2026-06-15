class Effigy < Formula
  desc "Unified task runner for monorepos and nested workspaces"
  homepage "https://github.com/inflatable-cookie/effigy"
  license "MIT"
  version "0.8.15"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.15/effigy-aarch64-apple-darwin"
      sha256 "e17ad0de8307a2feea43359d4a6de4b4354d34839cf383c5149e56fca1c74924"
    elsif Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.15/effigy-x86_64-apple-darwin"
      sha256 "c72b58c6d56f5fc5855bf4d41bb9b30e477bd2ac70af9c1752ca5fb41fa0c7ce"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.15/effigy-x86_64-unknown-linux-gnu"
      sha256 "0772b9c2a8e6101fbbab24b75d65444391aa9b50a84955115386288a33c789bf"
    elsif Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.15/effigy-aarch64-unknown-linux-gnu"
      sha256 "56506760cadeb439b388932c9d13af66999ae4d04f3fc8c23357bbba417334ee"
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
