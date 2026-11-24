cask "yaade" do
  version "0.19.0"
  sha256 "86bcc5d9810bf42eaa73f5184e2d7a4a2a1412548b9d01d6ac1eec9b27a8ce91"

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
