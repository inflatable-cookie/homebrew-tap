class Effigy < Formula
  desc "Unified task runner for monorepos and nested workspaces"
  homepage "https://github.com/inflatable-cookie/effigy"
  license "MIT"
  version "0.6.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.6.1/effigy-aarch64-apple-darwin"
      sha256 "ec5cf006e2603805593bafc02e75cb8fd4be80ee0ccd2cb8631f9719f5f519f0"
    elsif Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.6.1/effigy-x86_64-apple-darwin"
      sha256 "509afb18e31458f402e27151a89d00f81d4f5aa36bff2f451cb79c0fcd6f6899"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.6.1/effigy-x86_64-unknown-linux-gnu"
      sha256 "86a25a1ad6ce0566c39e25ff0c9bb7a053e49eea2f19cd2ec4c4424bfd20feb8"
    elsif Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.6.1/effigy-aarch64-unknown-linux-gnu"
      sha256 "088fd5ff7529843961e21580d28160a005f75b56383d18f7f80087235476497e"
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
