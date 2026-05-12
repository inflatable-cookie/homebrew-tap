class Effigy < Formula
  desc "Unified task runner for monorepos and nested workspaces"
  homepage "https://github.com/inflatable-cookie/effigy"
  license "MIT"
  version "0.6.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.6.0/effigy-aarch64-apple-darwin"
      sha256 "dff856c16d9347560b3985c93503aacae0253154bdea4baeea3a922477499527"
    elsif Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.6.0/effigy-x86_64-apple-darwin"
      sha256 "c3df2cfecd2b9145fc56453f4412e4cf958f93321a33f1578b034d41e7756406"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.6.0/effigy-x86_64-unknown-linux-gnu"
      sha256 "b46d7cdc2f76febf5f76a811c7561cf859516f2fb23bdf7a69845df0f1ef3cc8"
    elsif Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.6.0/effigy-aarch64-unknown-linux-gnu"
      sha256 "c31065db9a20de88c60892765009141b7cb7bcf17b4984c47fb64393a18ba8f2"
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
