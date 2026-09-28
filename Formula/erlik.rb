class Erlik < Formula
  desc "Apple Silicon (ARM64) Native Activity & Focus Intelligence Tracker for macOS"
  homepage "https://github.com/halilertekin/erlik"
  url "https://registry.npmjs.org/erlik/-/erlik-3.5.8.tgz"
  sha256 "251a1a19a3ebbbc139659e7e786d8252018b5e7185250c93520a1ac8273a4997"

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
      ERLÍK v3.5.8 installed.

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
