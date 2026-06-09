class Effigy < Formula
  desc "Unified task runner for monorepos and nested workspaces"
  homepage "https://github.com/inflatable-cookie/effigy"
  license "MIT"
  version "0.8.11"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.11/effigy-aarch64-apple-darwin"
      sha256 "3707c0756d1f8793ad725bafd758fa3ace2281b0fc212cc2fe38776a4a755114"
    elsif Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.11/effigy-x86_64-apple-darwin"
      sha256 "6267c1d19a2846faaffe961805c9372c3799b356932b9f33972ecd8c5e8b6ea9"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.11/effigy-x86_64-unknown-linux-gnu"
      sha256 "51adf2e10d53a5f66708cda867ca9e5f901efd7165b5a50c3c511f22e9692ce0"
    elsif Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.11/effigy-aarch64-unknown-linux-gnu"
      sha256 "45b676c25249489bb407f81abb227deada28006be42a38b503a884ead82e7be5"
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
