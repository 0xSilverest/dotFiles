#!/bin/sh

pip install pyright

yarn global add yaml-language-server
yarn global add bash-language-server
yarn global add solc
yarn global add diagnostic-languageserver
yarn global add vscode-langservers-extracted

git clone https://github.com/rust-analyzer/rust-analyzer.git && cd rust-analyzer

cargo xtask install --server

cd ../

rm -rf rust-analyzer/

cs install metals
cs install bloop

go install golang.org/x/tools/gopls@latest

# Haskell deps
ghcup install hls 1.6.1.0
stack install haskell-dap ghci-dap haskell-debug-adapter
