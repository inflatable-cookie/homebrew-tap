class Effigy < Formula
  desc "Unified task runner for monorepos and nested workspaces"
  homepage "https://github.com/inflatable-cookie/effigy"
  license "MIT"
  version "0.8.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.4/effigy-aarch64-apple-darwin"
      sha256 "6151f78cb4a1e3374a7baf6ad7a27f6f29f4eaed768051ba362888b9dad142bc"
    elsif Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.4/effigy-x86_64-apple-darwin"
      sha256 "bc5b545467d17236577ca5daf592985c62daa6976712849a34bc6995cbb5148e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.4/effigy-x86_64-unknown-linux-gnu"
      sha256 "327d8026509e5696d47a3e3876a7532cb782d487beb562719664201d329305f0"
    elsif Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.4/effigy-aarch64-unknown-linux-gnu"
      sha256 "ed065780ebbad6b0096e154cad25a6a923e1d674acb8eff920f5db3300cf198d"
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
