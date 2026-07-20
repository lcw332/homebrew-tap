class Thermalforge < Formula
  desc "Thermal performance tool for Apple Silicon"
  homepage "https://github.com/lcw332/ThermalForge"
  url "https://github.com/lcw332/ThermalForge/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "d62b077504de677a8afd5fa9116f66ed5f365b95d1c5dc3f6482fdb961d30019"
  license "MIT"

  depends_on xcode: :build

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/thermalforge"
  end
end
