# SPDX-License-Identifier: MIT OR AGPL-3.0-or-later
# SPDX-FileCopyrightText: 2024-2025 hyperpolymath
#
# claude-gitlab-bridge - Nix Flake (fallback to Guix)
# Primary: guix.scm | Fallback: flake.nix
{
  description = "Bridge between Claude AI and GitLab for enhanced developer productivity";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        # Development shell
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            # Deno runtime (RSR primary for web/scripts)
            deno

            # ReScript tooling
            nodejs_20
            nodePackages.npm

            # Development tools
            git
            jq

            # Guile/Scheme for SCM files
            guile
          ];

          shellHook = ''
            echo "claude-gitlab-bridge development environment"
            echo "Primary: Guix (guix.scm) | Fallback: Nix (flake.nix)"
            echo ""
            echo "Available tools:"
            echo "  - deno: $(deno --version | head -1)"
            echo "  - node: $(node --version)"
            echo "  - guile: $(guile --version | head -1)"
            echo ""
            echo "Run 'deno task dev' to start development server"
          '';
        };

        # Package definition
        packages.default = pkgs.stdenv.mkDerivation {
          pname = "claude-gitlab-bridge";
          version = "0.1.0";

          src = ./.;

          buildInputs = with pkgs; [ deno ];

          installPhase = ''
            mkdir -p $out/share/claude-gitlab-bridge
            cp -r . $out/share/claude-gitlab-bridge/
          '';

          meta = with pkgs.lib; {
            description = "Bridge between Claude AI and GitLab for developer productivity";
            homepage = "https://github.com/hyperpolymath/claude-gitlab-bridge";
            license = with licenses; [ mit agpl3Plus ];
            maintainers = [ ];
            platforms = platforms.all;
          };
        };
      }
    );
}
