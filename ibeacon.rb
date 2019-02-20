require "formula"

class Ibeacon < Formula
  homepage "https://github.com/matteocrippa/ibeacon-cli"
  url "https://github.com/matteocrippa/ibeacon-cli/archive/v1.0.1.tar.gz"
  sha256 "fdfad7fee2dd84c7db040c70ae6be5ef8fa2abcb1c812d5cf9f4e4eea5533c1c"
  head "https://github.com/matteocrippa/ibeacon-cli.git"

  bottle do
    cellar :any
    sha256 "fdfad7fee2dd84c7db040c70ae6be5ef8fa2abcb1c812d5cf9f4e4eea5533c1c" => :high_sierra
  end

  depends_on :macos => :high_sierra
  depends_on :xcode => :build

  def install
    xcodebuild "-configuration", "Release", "SYMROOT=build", "-verbose"
    prefix.install "build/Release/ibeacon"
    bin.write_exec_script "#{prefix}/ibeacon"
  end

  test do
    assert `#{bin}/ibeacon --version`.include?("Version")
  end
end
