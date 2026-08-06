class Effigy < Formula
  desc "Unified task runner for monorepos and nested workspaces"
  homepage "https://github.com/inflatable-cookie/effigy"
  license "MIT"
  version "0.9.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.9.1/effigy-aarch64-apple-darwin"
      sha256 "b9e90a9b71c89cb016f3cdf0e2de8203faffa817435137fb41175b0446c6f9d2"
    elsif Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.9.1/effigy-x86_64-apple-darwin"
      sha256 "ce1888a8d52335ab5809832bc4c9d02211be38bd748ef6205bf747705e692a2b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.9.1/effigy-x86_64-unknown-linux-gnu"
      sha256 "8ea9f27db4476b03c457c8c659fcb616748389a9fdd7ea021a745cbf2ca77e3d"
    elsif Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.9.1/effigy-aarch64-unknown-linux-gnu"
      sha256 "4588a7484a2d6a65023e91273dc3f7ff7d6463c34d2a647201bcbf3741db5419"
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
