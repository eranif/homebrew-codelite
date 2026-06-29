cask "codelite-official" do

    name "CodeLite"
    desc "IDE for C, C++, Rust, Python, PHP and Node.js"

    if Hardware::CPU.intel?
        version "17.6.0"
        filename = "codelite-x86_64.app.tar.gz"
        url "https://downloads.codelite.org/codelite/#{version}/codelite-x86_64.app.tar.gz"
        sha256 "e13755ab8edbc6e213269d73b206935c102d5b8ae2c0b3da24ae0a87cab22f57"
        depends_on macos: :monterey
    else
        version "18.4.0"
        filename = "codelite-macOS_26.4.1-arm64.app.tar.gz"
        url "https://downloads.codelite.org/codelite/#{version}/#{filename}"
        sha256 "395e227230446d8274767ef274f67a7ca087da2af1b61366b0548259b7949a11"
        depends_on macos: :tahoe
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
