class Killport < Formula
  desc "A command-line tool to kill processes listening on a specific port"
  homepage "https://github.com/jkfran/killport"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "#{homepage}/releases/download/v#{version}/killport-x86_64-apple-darwin.tar.gz"
      sha256 "e038ab43207a95702ad31719bf98abfd5b0c39e276ef45230722fbc916db69bd"
    elsif Hardware::CPU.arm?
      url "#{homepage}/releases/download/v#{version}/killport-aarch64-apple-darwin.tar.gz"
      sha256 "b31402afc2e59b1483a80c2ba1692a41ea4642c9f0d1c6a5c5b80e9e66c9bbae"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "#{homepage}/releases/download/v#{version}/killport-x86_64-linux-gnu.tar.gz"
      sha256 "0288bb11a1e141b0fc0b1e48124e2f560769cc9fe3efff430350456b7cd8310b"
    elsif Hardware::CPU.arm?
      url "#{homepage}/releases/download/v#{version}/killport-aarch64-linux-gnu.tar.gz"
      sha256 "86930d0387efcdc1c5b4bccd9f1f0869eec100adc1aa82ae12c6f1a15003d34b"
    end
  end

  def install
    bin.install "killport"
  end

  test do
    system "#{bin}/killport", "--version"
  end
end
