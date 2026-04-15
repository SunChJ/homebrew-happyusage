class Hu < Formula
  desc "A tiny cross-platform CLI for checking local AI tool usage"
  homepage "https://github.com/SunChJ/happyusage"
  version "0.2.5"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SunChJ/happyusage/releases/download/v#{version}/hu-darwin-arm64.tar.gz"
      sha256 "f7db042d5d6f42de6791aa6dd6e5c87226c47ae7795571677cbcfbf0f936abd4"
    elsif Hardware::CPU.intel?
      url "https://github.com/SunChJ/happyusage/releases/download/v#{version}/hu-darwin-amd64.tar.gz"
      sha256 "d7c94ee044bf39261a3147d959c90028743714d220ad4c7212472b88c774f71a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SunChJ/happyusage/releases/download/v#{version}/hu-linux-arm64.tar.gz"
      sha256 "0058c6ddc45c1085f05c0877b67381ef4c179c395cbdf1dce4f24ca681a1d175"
    elsif Hardware::CPU.intel?
      url "https://github.com/SunChJ/happyusage/releases/download/v#{version}/hu-linux-amd64.tar.gz"
      sha256 "57e7c77399fe4f950d4fd33231a7500641dceb1b13d5ac94434ed3c04a8c45f9"
    end
  end

  def install
    bin.install "hu"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hu version")
  end
end
