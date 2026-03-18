class Effigy < Formula
  desc "Unified task runner for monorepos and nested workspaces"
  homepage "https://github.com/inflatable-cookie/effigy"
  license "MIT"
  version "0.2.11"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.2.11/effigy-aarch64-apple-darwin"
      sha256 "a954f4bc356bcb0d58e91f25ecb0a21fda454f7ef34c8d3b38de3c1dcdeee480"
    elsif Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.2.11/effigy-x86_64-apple-darwin"
      sha256 "79c02d1f3cadc246326d947bd17f853be41b7bb019bc4eb04fb6a1314539be35"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.2.11/effigy-x86_64-unknown-linux-gnu"
      sha256 "4e52c4b2f5508396aba15ca11d83ddc0ba62d5de3e897a52a4adad8d0d22b9c3"
    elsif Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.2.11/effigy-aarch64-unknown-linux-gnu"
      sha256 "d129dd93dba59b23a9162c1fcc4d71e7ee6c3337ebd90145dabf750aa035a3ce"
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
