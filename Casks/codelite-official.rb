cask "codelite-official" do

    name "CodeLite"
    desc "IDE for C, C++, Rust, Python, PHP and Node.js"
    version "16.2.0"
    sha256 :no_check
    filename = "codelite-arm64.app.tar.gz"
    if Hardware::CPU.intel?
        url "https://downloads.codelite.org/codelite/#{version}/codelite-x86_64.app.tar.gz"
    else
        url "https://downloads.codelite.org/codelite/#{version}/codelite-arm64.app.tar.gz"
    end

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
