class HugoAT0820 < Formula
  desc "Configurable static site generator"
  homepage "https://gohugo.io/"
  url "https://github.com/gohugoio/hugo/archive/v0.82.0.tar.gz"
  sha256 "f156c31034f013b11ff19aec09ab4d47fd8689befaa6f58222b48ed970722b4b"
  license "Apache-2.0"
  head "https://github.com/gohugoio/hugo.git"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args, "-tags", "extended", "-o", bin/"hugo"

    # Build bash completion
    system bin/"hugo", "gen", "autocomplete", "--completionfile=hugo.sh"
    bash_completion.install "hugo.sh"

    # Build man pages; target dir man/ is hardcoded :(
    (Pathname.pwd/"man").mkpath
    system bin/"hugo", "gen", "man"
    man1.install Dir["man/*.1"]
  end

  test do
    site = testpath/"hops-yeast-malt-water"
    system "#{bin}/hugo", "new", "site", site
    assert_predicate testpath/"#{site}/config.toml", :exist?
  end
end
