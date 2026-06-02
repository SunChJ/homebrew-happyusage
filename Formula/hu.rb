class Hu < Formula
  desc "A tiny cross-platform CLI for checking local AI tool usage"
  homepage "https://github.com/SunChJ/happyusage"
  version "0.2.9"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SunChJ/happyusage/releases/download/v#{version}/hu-darwin-arm64.tar.gz"
      sha256 "5548fef7dc1b97390df4be6c7c633687fe2a757949b24c2019d2713a37e80860"
    elsif Hardware::CPU.intel?
      url "https://github.com/SunChJ/happyusage/releases/download/v#{version}/hu-darwin-amd64.tar.gz"
      sha256 "e0e53adc70c1b1cca3cf4323cdd02f1d59fcc1bffd603f4498e31161fa7b2d77"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SunChJ/happyusage/releases/download/v#{version}/hu-linux-arm64.tar.gz"
      sha256 "ad3b90d3533b01b084aabce3d7a57314b66f0029496bc3465916cb878e5d46f6"
    elsif Hardware::CPU.intel?
      url "https://github.com/SunChJ/happyusage/releases/download/v#{version}/hu-linux-amd64.tar.gz"
      sha256 "f77f92373214191198a0c7458cd4de72350552c2837123f297d81727ea1cfced"
    end
  end

  def install
    bin.install "hu"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hu version")
  end
end
