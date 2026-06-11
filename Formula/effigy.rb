class Effigy < Formula
  desc "Unified task runner for monorepos and nested workspaces"
  homepage "https://github.com/inflatable-cookie/effigy"
  license "MIT"
  version "0.8.12"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.12/effigy-aarch64-apple-darwin"
      sha256 "8453487b96a1217745db78832583f17bd71ea1c03e6f52f64633fa71252e06b1"
    elsif Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.12/effigy-x86_64-apple-darwin"
      sha256 "fb8167df2212634ef0e63ee8c74bf98858c8f833a33adca52be232021dd7ead0"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.12/effigy-x86_64-unknown-linux-gnu"
      sha256 "96fb5293817ffd8a75196e438337e3d8ff8df05c5550a015755e1e624775612b"
    elsif Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.8.12/effigy-aarch64-unknown-linux-gnu"
      sha256 "eacfc9e5fa98381002c7cb87b5f576b1b58e8e94750f57705469a0592299d94d"
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
