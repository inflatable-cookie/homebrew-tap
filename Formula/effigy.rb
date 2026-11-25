class Effigy < Formula
  desc "Unified task runner for monorepos and nested workspaces"
  homepage "https://github.com/inflatable-cookie/effigy"
  license "MIT"
  version "0.15.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.15.0/effigy-aarch64-apple-darwin"
      sha256 "f6e18a21aabc0bb1836c7a8ae6552ed7a24ed72bb5e1ad4bb135faf0fa42ed59"
    elsif Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.15.0/effigy-x86_64-apple-darwin"
      sha256 "e7d9b971f23975704a7ac6e757e510227ce2892e88662338fc06ac3a32a79101"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.15.0/effigy-x86_64-unknown-linux-gnu"
      sha256 "aa8b43e5c31ed18f2b15c7716a6c05171944f65f43910b5162c3f9f5274872fd"
    elsif Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.15.0/effigy-aarch64-unknown-linux-gnu"
      sha256 "e765e3d31ca152917d95a9a756a73e231a4140ca40561808e2df00bfacfb18de"
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
