class Tshc < Formula
  desc "Log in to multiple Teleport clusters using KeePass"
  homepage "https://github.com/kuyantus/tshc"
  url "https://github.com/kuyantus/tshc/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "e6694454edf09f6b6e451f7d5026cc5fd5d52cb0b1a69175da901cf5fe025679"
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
