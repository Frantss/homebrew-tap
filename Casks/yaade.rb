cask "yaade" do
  version "0.13.0"
  sha256 "7daddce09fbe16fb635d573f7feb62d173c457d490cb4ae5125eb83a993655d3"

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
