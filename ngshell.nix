with import <nixpkgs> {};

stdenv.mkDerivation {
    name = "node";
    buildInputs = [
        nodejs
	nodePackages.prettier_d_slim
	nodePackages.eslint
	gnat13
    ];
    shellHook = ''
      mkdir -p $PWD/.npm-global;
      npm set prefix $PWD/.npm-global;
      PATH="$PWD/.npm-global/bin:$PATH";
      source <(ng completion script);
    '';
}
