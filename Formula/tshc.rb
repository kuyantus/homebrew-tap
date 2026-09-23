class Tshc < Formula
  desc "Log in to multiple Teleport clusters using KeePass"
  homepage "https://github.com/kuyantus/tshc"
  url "https://github.com/kuyantus/tshc/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "c638cce051291b3f252675bc71f50659ad1c3148d8e78cb6d525e4a50dd96de6"
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
