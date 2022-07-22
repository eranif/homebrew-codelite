cask "codelite-official" do

    name "CodeLite"
    desc "IDE for C, C++, Rust, Python, PHP and Node.js"
    version "16.2.0"
    sha256 :no_check

    if Hardware::CPU.intel?
        filename "codelite-arm64.app.tgz"
    else
        filename "codelite-x86_64.app.tgz"
    end
    url "https://downloads.codelite.org/codelite/#{version}/#{filename}"

    homepage "https://codelite.org/"
    app "codelite.app"
    depends_on formula: [
        "libssh",
        "hunspell",
        "llvm" # for lldb-vscode, clangd
    ]
    depends_on macos: ">= :monterey"

    zap trash: [
        "~/Library/Application Support/codelite",
        "~/Library/Preferences/codelite.plist",
    ]
end