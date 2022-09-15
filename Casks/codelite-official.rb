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
        sha256 "6df6af104a92e0e86f4ae1f33c6a738f7b769c4d31b1336f14b5b7872f1bd3b9"
    end

    homepage "https://codelite.org/"
    app "codelite.app"
    depends_on formula: [
        "codelite-libssh",
        "hunspell",
        "llvm" # for lldb-vscode, clangd
    ]
    depends_on macos: ">= :monterey"

    zap trash: [
        "~/Library/Application Support/codelite",
        "~/Library/Preferences/codelite.plist",
    ]
end
