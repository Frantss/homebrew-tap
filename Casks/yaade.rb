cask "yaade" do
  version "0.18.1"
  sha256 "cfcb0ed311056a0f8bf0798bae90d518e66dc3c60150f778867a56470337fa86"

  url "https://github.com/Frantss/yaade-releases/releases/download/v#{version}/Yaade-#{version}-arm64.dmg"
  name "Yaade"
  desc "Run CLI coding agents across projects and review their changes"
  homepage "https://yaade.frantss.uy/"

  livecheck do
    skip "No version information available"
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Yaade.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Yaade.app"]
  end

  zap trash: "~/Library/Application Support/Yaade"
end
