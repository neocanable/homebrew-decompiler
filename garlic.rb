class Garlic < Formula
  desc "Android/Java decompiler installed via Homebrew"
  homepage "https://github.com/neocanable/garlic"

  on_macos do
    on_intel do
      url "https://github.com/neocanable/garlic/releases/download/v1.4-release/garlic-macos-x64"
      sha256 "491765704e01c69ceedbce3aedd89f2b481dc03b2cc51c48aadf0124a88e418e"
    end

    on_arm do
      url "https://github.com/neocanable/garlic/releases/download/v1.4-release/garlic-macos-aarch64"
      sha256 "64c54186dfef2e6d37683468814a70a4dc6713d31366394c2a66e314e688b91f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/neocanable/garlic/releases/download/v1.4-release/garlic-linux-x64"
      sha256 "b3e5c62b6b811f4d0ab4f4dc151fed0a10ae613a8185b35297174b2d366244de"
    end

    on_arm do
      url "https://github.com/neocanable/garlic/releases/download/v1.4-release/garlic-aarch64-linux"
      sha256 "7bbbb4a032d476c04d61de57043c66ec0e526959824d0ff65e3d39d4f2208025"
    end
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "garlic-macos-aarch64" => "garlic"
      end

      if Hardware::CPU.intel?
        bin.install "garlic-macos-x64" => "garlic"
      end
    elsif OS.linux?
      if Hardware::CPU.arm?
        bin.install "garlic-aarch64-linux" => "garlic"
      end

      if Hardware::CPU.intel?
        bin.install "garlic-linux-x64" => "garlic"
      end   
    end
  end

  test do
    system "#{bin}/garlic"
  end
end
