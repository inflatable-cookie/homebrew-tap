class Effigy < Formula
  desc "Unified task runner for monorepos and nested workspaces"
  homepage "https://github.com/inflatable-cookie/effigy"
  license "MIT"
  version "0.13.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.13.1/effigy-aarch64-apple-darwin"
      sha256 "f0bef7afeea0915385f2a31b45f84b84336850fd24a431675b33be9478ae6e30"
    elsif Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.13.1/effigy-x86_64-apple-darwin"
      sha256 "439463c1a7cd09031ee9cafce2b68304a426fae42b6bece2ba7bb5bf7fe11ea5"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.13.1/effigy-x86_64-unknown-linux-gnu"
      sha256 "1526523aa77f0d68e2ecf8707f1ae18aa36cb7db955de0c1871c30f122c4e3e6"
    elsif Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.13.1/effigy-aarch64-unknown-linux-gnu"
      sha256 "145d238eb8b6230f7d9318afb015acab08f7499d7989cea83bfa3891c33336cf"
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
