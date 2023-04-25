class Killport < Formula
  desc "A command-line tool to kill processes listening on a specific port"
  homepage "https://github.com/jkfran/killport"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "#{homepage}/releases/download/v#{version}/killport-x86_64-apple-darwin.tar.gz"
    elsif Hardware::CPU.arm?
      url "#{homepage}/releases/download/v#{version}/killport-aarch64-apple-darwin.tar.gz"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "#{homepage}/releases/download/v#{version}/killport-x86_64-linux-gnu.tar.gz"
    elsif Hardware::CPU.arm?
      url "#{homepage}/releases/download/v#{version}/killport-aarch64-linux-gnu.tar.gz"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "#{homepage}/releases/download/v#{version}/killport-x86_64-linux-gnu.tar.gz"
      elsif Hardware::CPU.is_32_bit?
        url "#{homepage}/releases/download/v#{version}/killport-i686-linux-gnu.tar.gz"
      else
        odie "Error: Unsupported Intel architecture."
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.arch == :armv7
        url "#{homepage}/releases/download/v#{version}/killport-armv7-linux-gnueabihf.tar.gz"
      elsif Hardware::CPU.is_32_bit?
        url "#{homepage}/releases/download/v#{version}/killport-arm-linux-gnueabihf.tar.gz"
      elsif Hardware::CPU.is_64_bit?
        url "#{homepage}/releases/download/v#{version}/killport-aarch64-linux-gnu.tar.gz"
      else
        odie "Error: Unsupported ARM architecture."
      end
    elsif Hardware::CPU.ppc64le?
      url "#{homepage}/releases/download/v#{version}/killport-powerpc64le-linux-gnu.tar.gz"
    elsif Hardware::CPU.s390x?
      url "#{homepage}/releases/download/v#{version}/killport-s390x-linux-gnu.tar.gz"
    else
      odie "Error: Unsupported architecture: #{Hardware::CPU.arch}"
    end
  end

  def install
    bin.install "killport"
  end

  test do
    system "#{bin}/killport", "--version"
  end
end
