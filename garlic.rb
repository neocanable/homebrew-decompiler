class Garlic < Formula
  desc "Android/Java decompiler installed via Homebrew"
  homepage "https://github.com/neocanable/garlic"

  on_macos do
    on_intel do
      url "https://github.com/neocanable/garlic/releases/download/v1.3-release/garlic-macos-x64"
      sha256 "sha256:41a1fa9f56832235dc5c15d6fc10bda543d70af2b9cde98a96ab3501c0223d09"
    end

    on_arm do
      url "https://github.com/neocanable/garlic/releases/download/v1.3-release/garlic-macos-aarch64"
      sha256 "42c496269b96dc85ed472730044fb50ce6dea3faded4fb84c68b0ac753791b08"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/neocanable/garlic/releases/download/v1.3-release/garlic-linux-x64"
      sha256 "43c3d01a621357653bd82bf57a2c1ea5b23cdd70afdcce323b81591f1d7c045d"
    end

    on_arm do
      url "https://github.com/neocanable/garlic/releases/download/v1.3-release/garlic-aarch64-linux"
      sha256 "2d89749bc58f7ea31484b322bb8fb701b242fc53b877d359a07df095ee6ed1f8"
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
