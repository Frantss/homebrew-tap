cask "yaade" do
  version "0.12.0"
  sha256 "8d68fa73bdf26c629d72d9de4528ce418589c0c5ca12bc2ee505cffdb1a61152"

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
