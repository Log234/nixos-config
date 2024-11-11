{ pkgs, lib, ... }:
{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    extraLuaConfig = lib.fileContents ./nvim/init.lua;
  };
}
