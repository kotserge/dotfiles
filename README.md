# dotfiles

This repository contains my dotfiles. I use them on my different Arch Linux systems with the following main components:

- Window manager: [i3-wm](https://i3wm.org/)
- Terminal emulator: [alacritty](https://github.com/alacritty/alacritty)
- Shell: [zsh](https://www.zsh.org/) with [oh-my-zsh](https://ohmyz.sh/)
- Application launcher: [rofi](https://github.com/davatorium/rofi)
- Editor: [neovim](https://neovim.io/) and [Code](https://code.visualstudio.com/)

I currently use a simple shell script to install/update my dotfiles with rsync. I plan to switch to a more sophisticated solution in the future, like [GNU Stow](https://www.gnu.org/software/stow/).

| ![](other/floating.png) | ![](other/lock.png) | ![](other/tiling.png) |
| :---------------------: | :-----------------: | :-------------------: |
|        Floating         |        Lock         |        Tiling         |

## Contents

### Applications Configuration

The [congif](/config/) directory contains the configuration files for the applications listed above and some other applications.

### bin

This directory contains some scripts that I use in my i3 config, like the [lock script](/bin/lock).

### wallpaper

These are the wallpapers I currently use:

- [Leaves.png](https://unsplash.com/photos/CBh4D3l0EwM)
- [Beton.png](https://unsplash.com/photos/pHBI_tVXA-A)
- [Sky.png](https://www.reddit.com/r/minimalism/comments/2612dh/art_some_of_my_minimal_inspired_photography_from/), [imgur](https://imgur.com/a/QwYoOu)
- [Wall.png](https://unsplash.com/photos/RONnMobq0_Y)

I use [feh](https://feh.finalrewind.org/) to set the wallpaper.
They are not included in this repository and have to be downloaded manually.

Most of the configuration files assume that the wallpapers are located in `~/Pictures/Wallpapers/Current/` (I need to change that in the future).

### Fonts

I mainly use one fonts and two icon fonts:

- [JetBrains Mono](https://www.jetbrains.com/lp/mono/)
- [Feather](https://github.com/AT-UI/feather-font)
- [Devicons](https://github.com/vorillaz/devicons)

These are also not included in this repository and have to be downloaded/installed manually.

## Neovim

I use [neovim](https://neovim.io/) as my main editor. You can find my configuration [here](https://github.com/confusedSerge/nvim-dotfiles).

## Polybar

For polybar I use a custom weather module, which can be found [here](https://github.com/confusedSerge/polybar-weather).

## Firefox

I use [Firefox](https://www.mozilla.org/en-US/firefox/new/) as my main browser. I use this custom [theme](https://color.firefox.com/?theme=XQAAAALKAgAAAAAAAABBKYhm849SCicxcUMVgXcGHf3p79EhVPVD1H7xcfZ9PTtZXOCodCzcptP_sW-LVB7sq7TqP9gymAAg3cpSvSO-MRy-QJvv3UOz8NB6_XLCL0_AGJY8Dky8K1ubFRu8wObn2-bymZB6fZsS3D7fYJTuJsrNaShCyDmMXfp_2vJ9Ff43zbDTS1CBHwmt4Lebn4OTqRRsOW5nYjD3vJWhMpQ0AS6vNNp6aLVCYjD1P5mb1VpUlZxhVuKLZlaJH0S_g-NN3_-ppeECxXjik--W7ZIy6IijUK3a_mnjELPAazNaHkJasknTSVtkfT1UTuRkWrwD_0lgXBRClArPMaZYnjtCKyhokQUfflcC9SSMW2LoMv74EIdI).

## Notes

The look and feel of my dotfiles is heavily inspired by a rice I found some years ago. Unfortunately I can't find the original repository anymore. If you know the original author, please let me know.

I only use Arch Linux, so I can't guarantee that these dotfiles work on other distributions.

## License

This project is licensed under the MIT License - see the [LICENSE.md](/LICENSE.md) file for details. Note that this only extends to my code and other modules, fonts, etc. are licensed under their respective licenses and do not fall under this license. If you find any license violations, please contact me immediately, as this is not intended.