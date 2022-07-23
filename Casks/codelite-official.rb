cask "codelite-official" do

    name "CodeLite"
    desc "IDE for C, C++, Rust, Python, PHP and Node.js"
    version "16.2.0"
    filename = "codelite-arm64.app.tar.gz"

    if Hardware::CPU.intel?
        url "https://downloads.codelite.org/codelite/#{version}/codelite-x86_64.app.tar.gz"
        sha256 "87e840405cb19ff94d734822e0fc7726f97e4ec18b59393a6eff469c6fff1ace"
    else
        url "https://downloads.codelite.org/codelite/#{version}/codelite-arm64.app.tar.gz"
        sha256 "2a8e51fef0b11f387b38db7103f4b742547ebb9cdc8e2f921a3f13936091108e"
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
