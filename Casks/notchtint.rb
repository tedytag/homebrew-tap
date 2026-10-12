cask "notchtint" do
  version "1.0.1"
  sha256 "f704e2f8c6a823354155ca3adc409add1ef219fbecef74cc3692212f2de51ce0"

  url "https://github.com/tedytag/notchtint/releases/download/v#{version}/NotchTint.zip"
  name "NotchTint"
  desc "Tints the menu bar around the MacBook notch with the fullscreen app's colours"
  homepage "https://github.com/tedytag/notchtint"

  depends_on arch: :arm64
  depends_on macos: :sonoma

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
