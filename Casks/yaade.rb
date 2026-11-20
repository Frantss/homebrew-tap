cask "yaade" do
  version "0.11.0"
  sha256 "cd1bb8346b5c0c8b8670983651b5063a0a8da05ea434b66f8091520632a77ddc"

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
