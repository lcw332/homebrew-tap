class Thermalforge < Formula
  desc "Thermal performance CLI for Apple Silicon"
  homepage "https://github.com/lcw332/ThermalForge"
  url "https://github.com/lcw332/ThermalForge/releases/latest/download/ThermalForge-1.0.0-macOS.zip"
  sha256 "DUMMY_PLACEHOLDER"
  license "MIT"

  depends_on macos: :sonoma

  def install
    bin.install "thermalforge"
  end
end
