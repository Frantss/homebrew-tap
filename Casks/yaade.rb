cask "yaade" do
  version "0.16.0"
  sha256 "9869d2ba2001828b75bce4958c056aaf4e84c62c658fa1be323b7894d0a8033c"

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
