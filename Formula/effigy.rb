class Effigy < Formula
  desc "Unified task runner for monorepos and nested workspaces"
  homepage "https://github.com/inflatable-cookie/effigy"
  license "MIT"
  version "0.11.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.11.0/effigy-aarch64-apple-darwin"
      sha256 "86ec9cfa3b5b46da4149d01ab357f5d65f46801023dec3972176a51dbd27e281"
    elsif Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.11.0/effigy-x86_64-apple-darwin"
      sha256 "628d34652728ad1ee4eb851237cf36889f8e610572269e38839c163ebfada405"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.11.0/effigy-x86_64-unknown-linux-gnu"
      sha256 "60e91ab9c44d3c5efab9d2485ac281ce0efc4fd13e1f0f4bf0d6c8cbb9e45425"
    elsif Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.11.0/effigy-aarch64-unknown-linux-gnu"
      sha256 "df557a041ea703f931951a4d7c5ccd5b187e818fb6b41eba282fd029f0c11ad8"
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
