require "formula"

class Ibeacon < Formula
  homepage "https://github.com/hayashi311/ibeacon-cli"
  url "https://github.com/hayashi311/ibeacon-cli/archive/v1.0.0.tar.gz"
  sha1 "2f2b635a1211950772c0ae5269b955c280b8fe73"
  head "https://github.com/hayashi311/ibeacon-cli.git"

  bottle do
    cellar :any
    sha1 "dca79e1570840edaa6e4ceabb8a8433ef5e3f20a" => :mavericks
  end

  depends_on :macos => :mavericks
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
