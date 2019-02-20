require "formula"

class Ibeacon < Formula
  homepage "https://github.com/hayashi311/ibeacon-cli"
  url "https://github.com/hayashi311/ibeacon-cli/archive/v1.0.0.tar.gz"
  sha256 "85ae0641476bcd12cd8982be18ca26245a495e522e2d66451c3dc7e9f4d21c48"
  head "https://github.com/hayashi311/ibeacon-cli.git"

  bottle do
    cellar :any
    sha256 "85ae0641476bcd12cd8982be18ca26245a495e522e2d66451c3dc7e9f4d21c48" => :mavericks
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
