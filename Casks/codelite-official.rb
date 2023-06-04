cask "codelite-official" do

    name "CodeLite"
    desc "IDE for C, C++, Rust, Python, PHP and Node.js"

    if Hardware::CPU.intel?
        version "17.0.0"
        filename = "codelite-x86_64.app.tar.gz"
        url "https://downloads.codelite.org/codelite/#{version}/codelite-x86_64.app.tar.gz"
        sha256 "42dd6bf46159c687a5739a3bbfaf925bcb16d27b52e6ff237f14f06f1221bbc9"
    else
        version "17.3.0"
        filename = "codelite-arm64.app.tar.gz"
        url "https://downloads.codelite.org/codelite/#{version}/codelite-arm64.app.tar.gz"
        sha256 "f65880bb5186017b0df64a67fb7eb2ce31ffedcea902ceedede3fe51d0dbd20e"
    end

    homepage "https://codelite.org/"
    app "codelite.app"
    depends_on formula: [
        "libssh",
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
