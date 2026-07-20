class ThermalforgeApp < Formula
  desc "Thermal performance GUI for Apple Silicon"
  homepage "https://github.com/lcw332/ThermalForge"
  url "https://github.com/lcw332/ThermalForge/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "d62b077504de677a8afd5fa9116f66ed5f365b95d1c5dc3f6482fdb961d30019"
  license "MIT"

  depends_on xcode: :build
  depends_on macos: :sonoma

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox",
           "--product", "ThermalForgeApp"

    app_path = "#{prefix}/ThermalForgeApp.app"
    mkdir_p "#{app_path}/Contents/MacOS"
    mkdir_p "#{app_path}/Contents/Resources"

    cp ".build/release/ThermalForgeApp", "#{app_path}/Contents/MacOS/ThermalForgeApp"

    if File.exist?("ThermalForge.icns")
      cp "ThermalForge.icns", "#{app_path}/Contents/Resources/ThermalForgeApp.icns"
    end

    (buildpath/"Info.plist").write plist_content
    cp "Info.plist", "#{app_path}/Contents/Info.plist"
  end

  def plist_content
    <<~XML
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"
        "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
      <dict>
        <key>CFBundleExecutable</key>
        <string>ThermalForgeApp</string>
        <key>CFBundleIdentifier</key>
        <string>com.lcw332.ThermalForgeApp</string>
        <key>CFBundleName</key>
        <string>ThermalForgeApp</string>
        <key>CFBundleVersion</key>
        <string>#{version}</string>
        <key>CFBundleShortVersionString</key>
        <string>#{version}</string>
        <key>CFBundleIconFile</key>
        <string>ThermalForgeApp</string>
        <key>LSMinimumSystemVersion</key>
        <string>14.0</string>
        <key>LSUIElement</key>
        <true/>
      </dict>
      </plist>
    XML
  end

  def caveats
    <<~EOS
      ThermalForgeApp was installed to #{prefix}/ThermalForgeApp.app.
      To use it, drag it to your Applications folder or run:
        open "#{prefix}/ThermalForgeApp.app"
    EOS
  end
end
