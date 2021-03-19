{
    "languageserver"= { 
        "dhall" = {
            "command" = "dhall-lsp-server";
            "filetypes" = [ "dhall" ];
        };

        "haskell"= {
            "command"= "haskell-language-server-wrapper";
            "args"= ["--lsp"];
            "rootPatterns"= ["*.cabal" "stack.yaml" "cabal.project" "package.yaml"];
            "filetypes"= ["haskell" "hs" "lhs"];
        };

       "metals"= {
            "command"= "metals-vim";
            "rootPatterns"= ["build.sbt"];
            "filetypes"= ["scala" "sbt"];
            "settings"= {
                "codeLens.enable"=true; 
                "metals.statusBarEnabled"= true;
            };
        };

        "latex"= {
                "command"= "/home/silverest/.local/share/nvim/plugged/vimtex/plugin/vimtex.vim";
                "ignoredRootPaths"= ["~"];
               "filetypes"= ["tex" "bib" "plaintex" "context"];
        };

        "kotlin"= {
            "command"= "kotlin-language-server";
            "filetypes"= ["kotlin"];
            "rootPatterns"= ["settings.gradle"];
        };

        "graphql"= {
            "command"= "graphql-lsp";
            "args"= ["server" "-m" "stream"];
            "filetypes"= ["graphql"];
        };

        "nix"= {
                "command"= "rnix-lsp";
                "filetypes"= ["nix"];
        };
   };
   
   "coc.preferences.formatOnType"=true;
}


