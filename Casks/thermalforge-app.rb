cask "thermalforge-app" do
  version "1.0.0"
  sha256 "DUMMY_PLACEHOLDER"

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
end
