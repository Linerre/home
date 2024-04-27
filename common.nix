{ config, pkgs, ... }:

{
  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # Rust overlay provides cargo
    # Other components available for x86_64-unknown-linux-gnu are:
    # cargo clippy clippy-preview llvm-tools llvm-tools-preview reproducible-artifacts rls
    # rls-preview rust rust-analysis rust-analyzer rust-analyzer-preview rust-docs rust-src
    # rust-std rustc rustc-dev rustc-docs rustfmt rustfmt-preview
    (rust-bin.stable.latest.default.override {
      extensions = [ "rust-src" "rust-docs" "rustc-docs" ];
    })
    rust-analyzer

    # Haskell bin (executables)
    # Avoid haskellPackages.fooXYZ as they may disppear (dropped), see:
    # https://nixos.org/manual/nixpkgs/unstable/#haskell-available-packages
    # Let ghc know where to find these libs, see:
    # #how-to-create-a-development-environment in hask4nix.readthedocs.io
    # hkgs
    (haskellPackages.ghcWithPackages (p: with p; [
      hlint           # 3.5
      hindent         # 6.0.0

      # tools
      cabal-install
      pandoc
    ]))
    haskellPackages.ghcid   # 0.8.9
    # haskellPackages.ghc   # 9.4.6 (LTS Stackage)
    haskellPackages.stack   # 2.11.1
    haskellPackages.haskell-language-server # support only GHC version of this flake

    # Ocaml
    ocamlPackages.ocaml
    ocamlPackages.dune_3
    ocamlPackages.findlib
    ocamlPackages.utop
    ocamlPackages.odoc
    ocamlPackages.ocaml-lsp
    ocamlformat

    # Coq
    coq
    coqPackages.coq-lsp

    # C/CPP
    pkg-config

    # Debugging
    # gdb
    valgrind          # 3.21

    # Bluespec HDL
    bluespec

    # Java and JVM langs such as clojure
    jdk17
    # jdk17_headless
    clojure
    clojure-lsp
    digital

    # Scheme
    guile
    chicken
    chickenPackages_5.chickenEggs.tree

    # Go
    go
    gopls

    # JavaScript
    nodejs_20                   # will install npm as well
    nodePackages.typescript-language-server
    nodePackages.ts-node
    typescript

    # tools
    just
    # typst
    # typstfmt
    zellij

    # Debugging
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];
}
