class Effigy < Formula
  desc "Unified task runner for monorepos and nested workspaces"
  homepage "https://github.com/inflatable-cookie/effigy"
  license "MIT"
  version "0.2.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.2.2/effigy-aarch64-apple-darwin"
      sha256 "8a180ade31a5fa1d34b8faadafa2d77892fde8e24ae5503ddc00b8e4e9a7beed"
    elsif Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.2.2/effigy-x86_64-apple-darwin"
      sha256 "6b44246f216d4ed3829b7c731e9c22be3c4e45454f5d3baacc26b1bc910b7f7b"
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
