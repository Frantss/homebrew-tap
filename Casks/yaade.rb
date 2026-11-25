cask "yaade" do
  version "0.20.0"
  sha256 "6e2b7cdf312516a6d562fc1050185461d9016ae6c3597e3b94b07e9e38077135"

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
