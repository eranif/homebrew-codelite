cask "codelite-official" do

    name "CodeLite"
    desc "IDE for C, C++, Rust, Python, PHP and Node.js"
    version "16.3.0"
    filename = "codelite-arm64.app.tar.gz"

    if Hardware::CPU.intel?
        url "https://downloads.codelite.org/codelite/#{version}/codelite-x86_64.app.tar.gz"
        sha256 "45c88607368161a50583b7914b21525d5aab9aff29c7dec59cc6d2d36779ac4b"
    else
        url "https://downloads.codelite.org/codelite/#{version}/codelite-arm64.app.tar.gz"
        sha256 "ddb63bd26468d01f7bac030850ea4f2735630ff50b66a9b8d355a2c10afcc95e"
    end

    homepage "https://codelite.org/"
    app "codelite.app"
    depends_on formula: [
        "libssh096",
        "hunspell",
        "llvm" # for lldb-vscode, clangd
    ]
    depends_on macos: ">= :monterey"

    zap trash: [
        "~/Library/Application Support/codelite",
        "~/Library/Preferences/codelite.plist",
    ]
end
