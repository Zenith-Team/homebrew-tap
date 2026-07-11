cask "pyamoto" do
  version "1.0.1"
  sha256 "5bb43c8ea7407ff0ac1577ac41e4f8f40f4f70710f269d3827f887a1e2e4d1a8"

  url "https://github.com/Zenith-Team/Pyamoto/releases/download/v#{version}/Pyamoto-v#{version}-macOS-universal.zip"
  name "Pyamoto"
  desc "New Super Mario Bros. U level editor (Extended fork)"
  homepage "https://github.com/Zenith-Team/Pyamoto"

  app "Pyamoto.app"

  postflight do
    system_command "xattr",
                   args: ["-r", "-d", "com.apple.quarantine", "#{appdir}/Pyamoto.app"]
  end

  zap trash: "~/Library/Application Support/Pyamoto"
end
