class Effigy < Formula
  desc "Unified task runner for monorepos and nested workspaces"
  homepage "https://github.com/inflatable-cookie/effigy"
  license "MIT"
  version "0.8.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.7/effigy-aarch64-apple-darwin"
      sha256 "3cf22f560df879ef060cf65b59a23f5c7c114c646169ddabcc6a5dd4553087a1"
    elsif Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.7/effigy-x86_64-apple-darwin"
      sha256 "dcfcc2cb4033cbb2cf18f22395bf87252d22e125225f465562526690745d10ad"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.7/effigy-x86_64-unknown-linux-gnu"
      sha256 "956939a0b97900633cefa0460a8c993ff7c102ba159409bc8d8894440cc3fce8"
    elsif Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.7/effigy-aarch64-unknown-linux-gnu"
      sha256 "a133a23d54b569580a184926561f2d730f5ad6c36c3974aa168d2e6ee0e338c5"
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
