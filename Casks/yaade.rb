cask "yaade" do
  version "0.21.0"
  sha256 "3fe4422ec9310acea5789a3a375bc327d394c2010431f27e6c0979c36165ed49"

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
