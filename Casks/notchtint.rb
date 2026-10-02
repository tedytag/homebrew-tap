cask "notchtint" do
  version "1.0.0"
  sha256 "68930089be4ab47b2972b7ce5b79361ee488efe934058b44ae12633b8d2dd5cd"

  url "https://github.com/tedytag/notchtint/releases/download/v#{version}/NotchTint.zip"
  name "NotchTint"
  desc "Tints the menu bar around the MacBook notch with the fullscreen app's colours"
  homepage "https://github.com/tedytag/notchtint"

  depends_on arch: :arm64
  depends_on macos: ">= :sonoma"

  app "NotchTint.app"

  uninstall quit: "com.notchtint.app"

  zap trash: "~/Library/Preferences/com.notchtint.app.plist"

  caveats <<~EOS
    NotchTint is not notarized, so macOS blocks the first launch.
    Allow it in System Settings → Privacy & Security → Open Anyway, or run:
      xattr -dr com.apple.quarantine #{appdir}/NotchTint.app
    Then grant Screen Recording permission and relaunch.
  EOS
end
