cask "codelite-official" do

    name "CodeLite"
    desc "IDE for C, C++, Rust, Python, PHP and Node.js"

    if Hardware::CPU.intel?
        version "17.6.0"
        filename = "codelite-x86_64.app.tar.gz"
        url "https://downloads.codelite.org/codelite/#{version}/codelite-x86_64.app.tar.gz"
        sha256 "e13755ab8edbc6e213269d73b206935c102d5b8ae2c0b3da24ae0a87cab22f57"
    	depends_on macos: ">= :monterey"
    else
        version "17.10.0"
        filename = "codelite-macOS_14.2.1-arm64.app.tar.gz"
        url "https://downloads.codelite.org/codelite/#{version}/#{filename}"
        sha256 "5c340e3bb3cade19938549f4de8812571694112e7273613bc21ebc9b9c20c586"
    	depends_on macos: :sonoma
    end

    homepage "https://codelite.org/"
    app "codelite.app"
    depends_on formula: [
        "llvm", # for lldb-vscode, clangd
        "clang-format"	
    ]

    postflight do
        system_command "/usr/bin/xattr",
                        args: ["-cr", "#{appdir}/codelite.app"],
                        sudo: false
    end

    zap trash: [
        "~/.codelite",
        "~/Library/Preferences/codelite.plist",
    ]
end
