cask "codelite-official" do

    name "CodeLite"
    desc "IDE for C, C++, Rust, Python, PHP and Node.js"

    if Hardware::CPU.intel?
        version "17.0.0"
        filename = "codelite-x86_64.app.tar.gz"
        url "https://downloads.codelite.org/codelite/#{version}/codelite-x86_64.app.tar.gz"
        sha256 "d115b04ce2274a48785ba6eaad82d9cd8f8975ab0f8a294e0a0259e40618698a"
    else
        version "17.0.0"
        filename = "codelite-arm64.app.tar.gz"
        url "https://downloads.codelite.org/codelite/#{version}/codelite-arm64.app.tar.gz"
        sha256 "61e3cdfdbaa290feb9e35eab31375b1cb9af0ba1f7e4d33198fd9e293f636b5c"
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
