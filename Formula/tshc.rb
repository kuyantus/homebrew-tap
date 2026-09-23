class Tshc < Formula
  desc "Log in to multiple Teleport clusters using KeePass"
  homepage "https://github.com/kuyantus/tshc"
  url "https://github.com/kuyantus/tshc/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "15062b5313a41be6794e6b093529b526e5d6c5ab00cf11b25298b0759f8f8d76"
  license "MIT"

  depends_on "go" => :build

  def fetch
    system "go", "mod", "download"
  end

  def install
    ENV["GOPROXY"] = "off"
    system "go", "build", *std_go_args(ldflags: "-X main.version=v#{version}"), "."
  end

  test do
    assert_equal "v#{version}", shell_output("#{bin}/tshc --version").strip

    ENV["HOME"] = testpath
    assert_match "edit it and run tshc again", shell_output("#{bin}/tshc 2>&1")
    assert_path_exists testpath/".tshc/teleports.yaml"
  end
end
