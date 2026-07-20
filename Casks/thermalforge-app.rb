cask "thermalforge-app" do
  version "1.0.0"
  sha256 "e041b2a1133bd6c7e5d399c5246075020c5c8057835c40c21a7a5f36fd3495b1"

  url "https://github.com/lcw332/ThermalForge/releases/latest/download/ThermalForge-#{version}-macOS.zip"
  name "ThermalForge"
  desc "Thermal performance GUI for Apple Silicon"
  homepage "https://github.com/lcw332/ThermalForge"

  depends_on macos: ">= :sonoma"

  app "ThermalForgeApp.app"

  postflight do
    system_command "xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/ThermalForgeApp.app"]
  end

  caveats do
    <<~EOS
      The GUI app requires the background daemon for fan control.
      Install the CLI and run setup:

        brew install lcw332/homebrew-tap/thermalforge
        sudo thermalforge install

      To uninstall later:
        sudo thermalforge uninstall
    EOS
  end
end
