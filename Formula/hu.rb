class Hu < Formula
  desc "A tiny cross-platform CLI for checking local AI tool usage"
  homepage "https://github.com/SunChJ/happyusage"
  version "0.2.7"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SunChJ/happyusage/releases/download/v#{version}/hu-darwin-arm64.tar.gz"
      sha256 "fb11a64d05099241a7d2a018d44a027de7aadff361b65bdc948cb599255f1471"
    elsif Hardware::CPU.intel?
      url "https://github.com/SunChJ/happyusage/releases/download/v#{version}/hu-darwin-amd64.tar.gz"
      sha256 "49d4fa929987eea00518b95a30279ffc1e7793e4ece9e168078a0580980a0cbe"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SunChJ/happyusage/releases/download/v#{version}/hu-linux-arm64.tar.gz"
      sha256 "63532dc4a972fc14b0c3116b3c29fa7497ce0827977f8c8b63436b5147fb86aa"
    elsif Hardware::CPU.intel?
      url "https://github.com/SunChJ/happyusage/releases/download/v#{version}/hu-linux-amd64.tar.gz"
      sha256 "1427527612d72f6bb087e417ed18f306a4c863e3f6af532a71994c3ceffe63ff"
    end
  end

  def install
    bin.install "hu"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hu version")
  end
end
