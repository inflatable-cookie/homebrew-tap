class Effigy < Formula
  desc "Unified task runner for monorepos and nested workspaces"
  homepage "https://github.com/inflatable-cookie/effigy"
  license "MIT"
  version "0.2.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.2.9/effigy-aarch64-apple-darwin"
      sha256 "50d8585b7053baab5bc2f7b05211d8d1e4488e8db89174386c42d7be3198e11d"
    elsif Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.2.9/effigy-x86_64-apple-darwin"
      sha256 "2dc4c9197b70736c0ae3749fa561b80e55176b1a267d129992acda071eebbf68"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.2.9/effigy-x86_64-unknown-linux-gnu"
      sha256 "725eaae19b57cbf7876db56e596113b50b42e2983b6fa43bb7d332cc6f2398e3"
    elsif Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.2.9/effigy-aarch64-unknown-linux-gnu"
      sha256 "9f4c75f4c019fd62f04350a628f40b55ab4cf9c09d97981e306a0d7b37bd42bc"
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
