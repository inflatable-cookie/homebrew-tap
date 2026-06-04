class Effigy < Formula
  desc "Unified task runner for monorepos and nested workspaces"
  homepage "https://github.com/inflatable-cookie/effigy"
  license "MIT"
  version "0.8.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.6/effigy-aarch64-apple-darwin"
      sha256 "7f434e3d7969dddad2a7684b726651ee4bf9fff4016d2cd147a72bc958f3e1c7"
    elsif Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.6/effigy-x86_64-apple-darwin"
      sha256 "ff075b8749c8edf016eddd293f68f131271e74e96cb9b6d66813fc68215262df"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.6/effigy-x86_64-unknown-linux-gnu"
      sha256 "36ac53adb3661b24bec774c395385d252aeaf3307b0e63eec6bbc2270c0bca0d"
    elsif Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.6/effigy-aarch64-unknown-linux-gnu"
      sha256 "cb912e862479f4b6c2be3e27545ac7b3b4d4a2ce7d319b18e185adb60377f1aa"
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
