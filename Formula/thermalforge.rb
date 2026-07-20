class Thermalforge < Formula
  desc "Thermal performance CLI for Apple Silicon"
  homepage "https://github.com/lcw332/ThermalForge"
  url "https://github.com/lcw332/ThermalForge/releases/latest/download/ThermalForge-1.0.0-macOS.zip"
  sha256 "2dbb6762a74bad929b605f53669fa160178d3daa82e92983098ed4d368963007"
  license "MIT"

  depends_on macos: :sonoma

  def install
    bin.install "thermalforge"
  end

  def caveats
    <<~EOS
      To install the background daemon (required for fan control), run:
        sudo thermalforge install

      To uninstall later:
        sudo thermalforge uninstall
    EOS
  end
end
