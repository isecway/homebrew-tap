class NodeSass < Formula
  require "language/node"

  desc "JavaScript implementation of a Sass compiler"
  homepage "https://github.com/sass/dart-sass"
  url "https://registry.npmjs.org/sass/-/sass-1.58.1.tgz"
  sha256 "0333477ee6ce794853806f74f8aa77c095b00e52918ab5494cc7563edde4ff86"
  license "MIT"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "895978ab313fd926921618fe13bafbe124a9836179ddbe15727dda746de7566c"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "895978ab313fd926921618fe13bafbe124a9836179ddbe15727dda746de7566c"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "895978ab313fd926921618fe13bafbe124a9836179ddbe15727dda746de7566c"
    sha256 cellar: :any_skip_relocation, ventura:        "895978ab313fd926921618fe13bafbe124a9836179ddbe15727dda746de7566c"
    sha256 cellar: :any_skip_relocation, monterey:       "895978ab313fd926921618fe13bafbe124a9836179ddbe15727dda746de7566c"
    sha256 cellar: :any_skip_relocation, big_sur:        "895978ab313fd926921618fe13bafbe124a9836179ddbe15727dda746de7566c"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "f953c4dd31e3c352ee59c0bda84ef7cec535bdb41f830c541231c63e538f4d4e"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    (testpath/"test.scss").write <<~EOS
      div {
        img {
          border: 0px;
        }
      }
    EOS

    assert_equal "div img{border:0px}",
    shell_output("#{bin}/sass --style=compressed test.scss").strip
  end
end
