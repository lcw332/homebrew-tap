cask "thermalforge-app" do
  version "1.0.0"
  sha256 "2dbb6762a74bad929b605f53669fa160178d3daa82e92983098ed4d368963007"

  url "https://github.com/lcw332/ThermalForge/releases/latest/download/ThermalForge-#{version}-macOS.zip"
  name "ThermalForge"
  desc "Thermal performance GUI for Apple Silicon"
  homepage "https://github.com/lcw332/ThermalForge"

  depends_on macos: ">= :sonoma"

  app "ThermalForgeApp.app"

  postflight do
    cli = "#{appdir}/ThermalForgeApp.app/Contents/Resources/thermalforge"

    system_command "/usr/bin/osascript",
                   args: [
                     "-e", <<~APPLESCRIPT
                       do shell script "#{cli} install 2>&1 || true" with administrator privileges
                     APPLESCRIPT
                   ]

    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/ThermalForgeApp.app"]
  end
end
