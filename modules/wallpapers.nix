{ config, lib, pkgs, ... }:

let
	genericPool = pkgs.symlinkJoin {
		name = "generic-wallpapers";
		paths = with pkgs.nixos-artwork.wallpapers; [
			simple-blue simple-dark-gray nineish gear dracula binary-blue
		];
	};

	personalPool = "/home/gabriel/Pictures/Wallpapers/Personal";
in
{
	options.my.wallpaperDir = lib.mkOption {
		type = lib.types.str;
		description = "Directory Cinnamon uses as its wallpaper slideshow source.";
	};

	config = {
		# --- Base system = "Generic" ---
		my.wallpaperDir = "${genericPool}/share/backgrounds/nixos";

		# --- Cinnamon + systemd-boot ---
		services.xserver.enable = true;
		services.xserver.displayManager.lightdm.enable = true;
		services.xserver.desktopManager.cinnamon.enable = true;

		boot.loader.systemd-boot.enable = true;
		boot.loader.efi.canTouchEfiVariables = true;
		boot.loader.timeout = 5;

		# Wallpaper settings, driven by the single option above
		programs.dconf.profiles.user.databases = [{
			lockAll = true; # these keys win over any stale per-user values
			settings = {
				"org/cinnamon/desktop/background" = {
					picture-options = "zoom";
				};
				"org/cinnamon/desktop/background/slideshow" = {
					slideshow-enabled = true;
					image-source = "directory://${config.my.wallpaperDir}";
					delay = lib.gvariant.mkInt32 15; # minutes
					random-order = true;
				};
			};
		}];

		# --- The only difference: "Personal" ---
		specialisation.personal.configuration = {
			my.wallpaperDir = lib.mkForce personalPool;
			system.nixos.tags = [ "personal" ];
		};

		system.nixos.tags = [ "generic" ];
	};
}
