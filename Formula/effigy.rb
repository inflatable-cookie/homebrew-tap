class Effigy < Formula
  desc "Unified task runner for monorepos and nested workspaces"
  homepage "https://github.com/inflatable-cookie/effigy"
  license "MIT"
  version "0.2.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.2.5/effigy-aarch64-apple-darwin"
      sha256 "04795f3b6b01d39f0cca021c3463f29f8b1c8b435b640e2d2490b2d3ae915901"
    elsif Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.2.5/effigy-x86_64-apple-darwin"
      sha256 "35f666584616c2fe044691a626281dbddca3c84299145bd0d741835fc2522ed4"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.2.5/effigy-x86_64-unknown-linux-gnu"
      sha256 "e9ffa32a401083892035b4a4bc1b2e78bbd2c96b322674246cddd5f180fc9e2d"
    elsif Hardware::CPU.arm?
      url "https://github.com/inflatable-cookie/effigy/releases/download/v0.2.5/effigy-aarch64-unknown-linux-gnu"
      sha256 "e58088f1688cf139cfe45c4b4918e831f80ebe63adc0a93feecdccb59408147b"
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
