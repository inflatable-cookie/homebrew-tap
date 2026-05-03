class Effigy < Formula
  desc "Unified task runner for monorepos and nested workspaces"
  homepage "https://github.com/inflatable-cookie/effigy"
  license "MIT"
  version "0.3.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.3.3/effigy-aarch64-apple-darwin"
      sha256 "70c726ce812c227b86265d1663b39276e262acab533ff6f33c1f3b9c71f47f02"
    elsif Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.3.3/effigy-x86_64-apple-darwin"
      sha256 "f3b5a17ace6a74439aeafce17bbd1e33c2b12981aa67a4142ea97e89c3a6c5f0"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.3.3/effigy-x86_64-unknown-linux-gnu"
      sha256 "77f44190d99211b86c0f735e85aa40ade62b9235b82d18b66e21e35323ef00a1"
    elsif Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.3.3/effigy-aarch64-unknown-linux-gnu"
      sha256 "12deb6236208729ea9b1d6a79633993deb97bacab5edeafeac3751a1ebdd2796"
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
