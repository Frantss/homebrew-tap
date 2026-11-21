cask "yaade" do
  version "0.14.0"
  sha256 "e26294cee085e3e1437f02cc14918a46c82e56bdf6e6545f376a5c363547fad6"

  url "https://releases.yaade.frantss.uy/Yaade-#{version}-arm64.dmg"
  name "Yaade"
  desc "Run CLI coding agents across projects and review their changes"
  homepage "https://yaade.frantss.uy/"

  livecheck do
    skip "No version information available"
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Yaade.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Yaade.app"]
  end

  zap trash: "~/Library/Application Support/Yaade"
end
