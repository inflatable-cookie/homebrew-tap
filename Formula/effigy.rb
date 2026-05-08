class Effigy < Formula
  desc "Unified task runner for monorepos and nested workspaces"
  homepage "https://github.com/inflatable-cookie/effigy"
  license "MIT"
  version "0.5.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.5.0/effigy-aarch64-apple-darwin"
      sha256 "47d5626949a80f8daafa1a1439f01f4e28636a9b44f937f2f25f349985203ebf"
    elsif Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.5.0/effigy-x86_64-apple-darwin"
      sha256 "b278c0dcbb1988fded159eb04fc19d684082b153c93aa38a81b32e9ca176c349"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.5.0/effigy-x86_64-unknown-linux-gnu"
      sha256 "d44c126a1b59436a6db2bcb3579ca13f4d06305dfe933a86bec2b73c7733d2c6"
    elsif Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.5.0/effigy-aarch64-unknown-linux-gnu"
      sha256 "5a13729039d2d72e19fb245315ad3c95b1eb5fb2dda18384522d032972589648"
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
