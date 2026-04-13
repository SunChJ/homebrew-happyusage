class Hu < Formula
  desc "A tiny cross-platform CLI for checking local AI tool usage"
  homepage "https://github.com/SunChJ/happyusage"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SunChJ/happyusage/releases/download/v#{version}/hu-darwin-arm64.tar.gz"
      sha256 "ed3d453490fe36e4d817792cb2119656f44764d347275ced52bedfa5f5589c6b"
    elsif Hardware::CPU.intel?
      url "https://github.com/SunChJ/happyusage/releases/download/v#{version}/hu-darwin-amd64.tar.gz"
      sha256 "66d1f5b5e7a6baa39ee954649031e6722d7bba5864b25d2eb6ecb4309003a928"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SunChJ/happyusage/releases/download/v#{version}/hu-linux-arm64.tar.gz"
      sha256 "c99e604126619498b127fe02048fa3d2575481aa3386ac20ee51bf840aaba822"
    elsif Hardware::CPU.intel?
      url "https://github.com/SunChJ/happyusage/releases/download/v#{version}/hu-linux-amd64.tar.gz"
      sha256 "81e80070c588352d125e484f395f94b6c98ecf213601eff47e7166c1772e1959"
    end
  end

  def install
    bin.install "hu"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hu version")
  end
end
