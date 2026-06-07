class Effigy < Formula
  desc "Unified task runner for monorepos and nested workspaces"
  homepage "https://github.com/inflatable-cookie/effigy"
  license "MIT"
  version "0.8.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.8/effigy-aarch64-apple-darwin"
      sha256 "93d2a84f7c03fbc02b226fe466513f29fb2007c70f38c82da7c026ba229d468f"
    elsif Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.8/effigy-x86_64-apple-darwin"
      sha256 "6130b27743b865fb90b0f57de8a7eb7bb0251e01b839b88fb670ddcb28a475bd"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.8/effigy-x86_64-unknown-linux-gnu"
      sha256 "225c6273e022ad0a4664a36fc0a98bf231b4b9edc4a921d1da591da3991f7861"
    elsif Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.8/effigy-aarch64-unknown-linux-gnu"
      sha256 "0f6c07a471bf72c208d962fed03ecb32967314e52ee889a6ad67b49f775562de"
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
