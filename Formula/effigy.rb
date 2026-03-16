class Effigy < Formula
  desc "Unified task runner for monorepos and nested workspaces"
  homepage "https://github.com/inflatable-cookie/effigy"
  license "MIT"
  version "0.2.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.2.8/effigy-aarch64-apple-darwin"
      sha256 "dd62e1747f481972d3734dd8eb442a0918c4d098eb23ad140598713a06f0324e"
    elsif Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.2.8/effigy-x86_64-apple-darwin"
      sha256 "824204f00e2ae2f406dbba00f695a4ba2363340e2b844c3f89f098a9dbf69882"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.2.8/effigy-x86_64-unknown-linux-gnu"
      sha256 "a6fc623c5512a28ef34515eee43f98272f746923fcd566a4bec83aaa3e380abe"
    elsif Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.2.8/effigy-aarch64-unknown-linux-gnu"
      sha256 "8b829a24820122ce1bff0cb778d519d070470475f0e6c0fbe7009d6c4eeb2348"
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
