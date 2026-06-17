class Effigy < Formula
  desc "Unified task runner for monorepos and nested workspaces"
  homepage "https://github.com/inflatable-cookie/effigy"
  license "MIT"
  version "0.8.17"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.17/effigy-aarch64-apple-darwin"
      sha256 "bf9303ed14c04718d57abc8f3697dfc5d805a1758134749dc3b60845a4f31541"
    elsif Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.17/effigy-x86_64-apple-darwin"
      sha256 "de5a2f6466d02b7ff9dda24402fa192bad6a4db8812446bff9e5debaad4b875b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.17/effigy-x86_64-unknown-linux-gnu"
      sha256 "cc31a7b9fdd0c51595c3db38b6cbd006e94bfcb1f2a118295c9e7b7b6b717474"
    elsif Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.17/effigy-aarch64-unknown-linux-gnu"
      sha256 "54fbf5191d80420519e9bd58d4e8628b70b9a51a8cc8837d21c1b4cf1275ee3d"
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
