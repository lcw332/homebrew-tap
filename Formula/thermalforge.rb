class Thermalforge < Formula
  desc "Thermal performance CLI for Apple Silicon"
  homepage "https://github.com/lcw332/ThermalForge"
  url "https://github.com/lcw332/ThermalForge/releases/latest/download/ThermalForge-1.0.0-macOS.zip"
  sha256 "e041b2a1133bd6c7e5d399c5246075020c5c8057835c40c21a7a5f36fd3495b1"
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
