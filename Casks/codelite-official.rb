cask "codelite-official" do

    name "CodeLite"
    desc "IDE for C, C++, Rust, Python, PHP and Node.js"

    if Hardware::CPU.intel?
        version "16.3.0"
        filename = "codelite-x86_64.app.tar.gz"
        url "https://downloads.codelite.org/codelite/#{version}/codelite-x86_64.app.tar.gz"
        sha256 "45c88607368161a50583b7914b21525d5aab9aff29c7dec59cc6d2d36779ac4b"
    else
        version "16.4.0"
        filename = "codelite-arm64.app.tar.gz"
        url "https://downloads.codelite.org/codelite/#{version}/codelite-arm64.app.tar.gz"
        sha256 "78bee7178dbab33cb51ba7ebfae0066f15576edf8500027b8c152ffdc1e4da3a"
    end

    homepage "https://codelite.org/"
    app "codelite.app"
    depends_on formula: [
        "libssh096",
        "hunspell",
        "llvm", # for lldb-vscode, clangd
        "clang-format"	
    ]
    depends_on macos: ">= :monterey"


    postflight do
        system_command "/usr/bin/xattr",
                        args: ["-cr", "#{appdir}/codelite.app"],
                        sudo: false
    end

    zap trash: [
        "~/Library/Application Support/codelite",
        "~/Library/Preferences/codelite.plist",
    ]
end
