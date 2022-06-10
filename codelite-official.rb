cask "codelite-official" do
  version "16.1.0"
  sha256 no_check
  
  url "https://downloads.codelite.org/codelite/#{version}/codelite.app.tar.gz"
  name "CodeLite"
  desc "IDE for C, C++, PHP and Node.js"
  homepage "https://codelite.org/"

  livecheck do
    url "https://downloads.codelite.org/"
    strategy :page_match do |page|
      match = page.match(/CodeLite\s*(\d+\.\d+)((?:\.\d+)*)\s*-\s*Stable\s*Release/i)
      next if match.blank?

      "#{match[1]}#{match[2].presence || ".0"}"
    end
  end
  
  depends_on formula: [
    :libssh,
    :hunspell,
  ]

  app "codelite.app"

  zap trash: [
    "~/Library/Application Support/codelite",
    "~/Library/Preferences/codelite.plist",
  ]
end