class Effigy < Formula
  desc "Unified task runner for monorepos and nested workspaces"
  homepage "https://github.com/inflatable-cookie/effigy"
  license "MIT"
  version "0.8.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.2/effigy-aarch64-apple-darwin"
      sha256 "fa525ccfe4d297c4c5d9979b426d6b34578cfbe2bdb2ef97d48bfbc496164fda"
    elsif Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.2/effigy-x86_64-apple-darwin"
      sha256 "7f680aab0fea3d7aee3164e4c72023a1ae0fee954c747835e9842366de5ec534"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.2/effigy-x86_64-unknown-linux-gnu"
      sha256 "9437da68247e7f9a01834e051bc7a5aa0746dbfeadad06623ef5b1588bcc39db"
    elsif Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.2/effigy-aarch64-unknown-linux-gnu"
      sha256 "997e6890ae19a5cc07498310c28d3ae904abbe37cee7e8a381a184c42651a2c1"
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
