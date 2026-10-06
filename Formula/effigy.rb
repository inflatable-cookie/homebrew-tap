class Effigy < Formula
  desc "Unified task runner for monorepos and nested workspaces"
  homepage "https://github.com/inflatable-cookie/effigy"
  license "MIT"
  version "0.14.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.14.0/effigy-aarch64-apple-darwin"
      sha256 "92d08c760a42b7596701b9fe638c9238b424e5a23609824c4a3600f861686020"
    elsif Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.14.0/effigy-x86_64-apple-darwin"
      sha256 "1be629d3fb430ccde4099a82e2f74e340fee72429cc353073319a7af0b2f336b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.14.0/effigy-x86_64-unknown-linux-gnu"
      sha256 "661258e2a8d502464e442bdabad92eec3004871c9a1002fd50a33b30d9cf2014"
    elsif Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.14.0/effigy-aarch64-unknown-linux-gnu"
      sha256 "c534179d045b9730e884fe27643d5296d6208c8bbc0cf8f92436ed756971a21d"
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
