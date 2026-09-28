class Erlik < Formula
  desc "Apple Silicon (ARM64) Native Activity & Focus Intelligence Tracker for macOS"
  homepage "https://github.com/halilertekin/erlik"
  url "https://registry.npmjs.org/erlik/-/erlik-3.5.9.tgz"
  sha256 "e93e95a200ea416e509a0f2f81f942cf67fcaf6c5bfadc2692bc96c5ad526652"

  depends_on :macos
  depends_on arch: :arm64
  depends_on "node"

  def install
    # Prebuilt arm64 binary + dashboard + erlik.sh wrapper (npm tarball'ı aynen)
    libexec.install Dir["*"]
    chmod 0755, libexec/"erlik-app", libexec/"erlik.sh"
    bin.install_symlink libexec/"bin/erlik-cli.js" => "erlik"
  end

  def caveats
    <<~EOS
      ERLÍK v3.5.9 installed.

      Start:    erlik start
      Stop:     erlik stop
      Status:   erlik status

      Dashboard: http://localhost:5757
      Pro features (Clipboard HUD, AI-agent intelligence):
        https://erlik.be/#pricing
    EOS
  end

  test do
    assert File.exist? libexec/"erlik-app"
    assert_match "erlik", File.read(libexec/"erlik.sh")
  end
end
