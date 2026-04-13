class Hu < Formula
  desc "A tiny cross-platform CLI for checking local AI tool usage"
  homepage "https://github.com/SunChJ/happyusage"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SunChJ/happyusage/releases/download/v#{version}/hu-darwin-arm64.tar.gz"
      sha256 "996af7869da5b4481569d5504a02721d852ef668b937b50f6716957234c3b038"
    elsif Hardware::CPU.intel?
      url "https://github.com/SunChJ/happyusage/releases/download/v#{version}/hu-darwin-amd64.tar.gz"
      sha256 "5b160dddea63a2672fb9c6915fba60d5f269a99bcd3f8f608a15db0ef860a632"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SunChJ/happyusage/releases/download/v#{version}/hu-linux-arm64.tar.gz"
      sha256 "43e50a4775e2a29be6be8eb6ce94a3adbea21381a861af8ff90291ff0613c7d3"
    elsif Hardware::CPU.intel?
      url "https://github.com/SunChJ/happyusage/releases/download/v#{version}/hu-linux-amd64.tar.gz"
      sha256 "43c8c1817f3735df180f141c81642a9464bc6230646f210dd4c5405488f642ca"
    end
  end

  def install
    bin.install "hu"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hu version")
  end
end
