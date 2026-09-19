cask "pyamoto" do
  version "1.2"
  sha256 "fd824f2e7e3bee25b0f8d870640a5aff33c2f6c7cbf2fb4786555a524ca89f32"

  url "https://github.com/Zenith-Team/Pyamoto/releases/download/v#{version}/Pyamoto-v#{version}-macOS-universal.zip"
  name "Pyamoto"
  desc "New Super Mario Bros. U level editor (Extended fork)"
  homepage "https://github.com/Zenith-Team/Pyamoto"

  app "Pyamoto.app"

  postflight_steps do
    run "/usr/bin/xattr",
      args: ["-dr", "com.apple.quarantine", "{{appdir}}/Pyamoto.app"],
      must_succeed: false
  end

  zap trash: "~/Library/Application Support/Pyamoto"
end
