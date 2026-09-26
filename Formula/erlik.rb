class Erlik < Formula
  desc "Apple Silicon (ARM64) Native Activity & Focus Intelligence Tracker for macOS"
  homepage "https://erlik.be"
  url "https://registry.npmjs.org/erlik/-/erlik-3.5.6.tgz",
      sha256: "03eecf00a1ced9ea226152b490bc0965d3962f6bdf29b9cd48c5d154b6c5e8b5"
  license :all
  head "https://github.com/halilertekin/erlik.git", branch: "main"

  depends_on :macos
  depends_on arch: :arm64
  depends_on "node"

  def install
    libexec.install "erlik-app", "erlik.sh", "index.html", "clipboard_panel.html"
    (libexec/"bin").mkpath
    bin.install_symlink libexec/"bin/erlik-cli.js" => "erlik-cli"
    libexec.install "assets"
    (bin/"erlik").write_env_script(libexec/"erlik.sh", { ERLIK_HOME: libexec })
  end

  def caveats
    <<~EOS
      🐺 ERLÍK v3.5.6 installed!
      Start:  erlik start   (or run #{libexec}/erlik.sh start)
      Stop:   erlik stop
      Status: erlik status

      Pro features (Clipboard HUD + AI-agent intelligence) unlock with a
      license key from the dashboard 🔑 — https://erlik.be/#pricing
    EOS
  end
end
