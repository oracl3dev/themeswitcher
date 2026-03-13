# Hyprland Theme & Wallpaper Scripts # 

Custom scripts for manually picking wallpapers and themes in Hyprland, with pywal-generated color schemes for Kitty terminals. Smooth wallpaper transitions, automatic color updates, and seamless integration.

# Features # 

Pick themes manually using Wofi.

Smooth wallpaper transitions with swww.

Automatic color generation via pywal.

New Kitty terminals inherit colors automatically.

Update all running Kitty terminals instantly (optional).

# Prerequisites # 

Install the following tools on Arch Linux:

Tools used and their purposes :3 
bash	- runs the scripts
swww	- wallpaper management for Hyprland
pywal	- generates color schemes from wallpapers
kitty	- terminal emulator
wofi	- menu launcher for selecting themes/wallpapers

# Folder Structure #

repo-root/
├── README.md
├── scripts/
│  ├── apply-theme.sh
│   ├── restore-theme.sh
│  └── theme-picker.sh
├── themes/
│   └── themes.conf           # format: theme_name|/full/path/to/wallpaper.png
└── wallpapers/               # folder with your wallpapers !
themes.conf format:

`theme_name|/full/path/to/wallpaper.png`

wallpaper.png can be a path to images in ~/Pictures/wallpapers/ or in the repo wallpapers/ folder.

# Kitty Configuration #

Add this line to your ~/.config/kitty/kitty.conf:

`include ~/.cache/wal/colors-kitty.conf`

Ensures new Kitty terminals automatically use wal-generated colors.

# Installation & Setup #

Clone the repository:

`git clone https://github.com/<your-username>/<repo-name>.git ~/theme-scripts
cd ~/theme-scripts`

Copy scripts to your config folder:

`mkdir -p ~/.config/theme/scripts
cp scripts/*.sh ~/.config/theme/scripts/
chmod +x ~/.config/theme/scripts/*.sh`

Copy themes and optional wallpapers:

`mkdir -p ~/.config/themes
cp themes/themes.conf ~/.config/themes/
mkdir -p ~/Pictures/wallpapers
cp -r wallpapers/* ~/Pictures/wallpapers/   # optional`

Install dependencies on Arch:

`sudo pacman -S swww pywal kitty wofi`

Run the theme picker:

`~/.config/theme/scripts/theme-picker.sh`

Select a theme/wallpaper in Wofi.

Wallpaper is applied with smooth fade.

Colors are generated via pywal for Kitty.

Hyprland reloads automatically.

Optional: restore last applied theme at startup:

`~/.config/theme/scripts/restore-theme.sh`

Can be added to Hyprland startup hooks.

Usage Examples
Pick and apply a theme
`~/.config/theme/scripts/theme-picker.sh`
Restore last theme
`~/.config/theme/scripts/restore-theme.sh`
Apply a specific wallpaper manually
`~/.config/theme/scripts/apply-theme.sh <theme_name> /full/path/to/wallpaper.png`

# Script Overview #
`apply-theme.sh`

Sets wallpaper via swww (supports smooth transitions).

Generates color palette via pywal (Kitty included).

Updates running Kitty terminals.

Reloads Hyprland.

Saves theme state in .current_theme.

`restore-theme.sh`

Reads .current_theme.

Preloads wallpaper (no transition).

Calls apply-theme.sh for full application.

`theme-picker.sh`

Reads themes.conf.

Lets you pick a theme in Wofi.

Calls apply-theme.sh with the selected theme and wallpaper.

Transition Options (swww)

`fade`	- smooth opacity transition (the smoothest one in my opinion)
`wipe` - wipes old wallpaper to reveal new one
`slide`	- slides wallpaper in from a direction (left, right, top, bottom)
`instant` -	immediate swap, no transition (lame)

Example smooth fade:

`swww img "$WALL" --transition-type fade --transition-duration 3` (transition duration is there to make the animation smoother)

# Updating Running Kitty Terminals #

New Kitty terminals pick up wal colors automatically.
To update all currently running terminals:

`kitty @ set-colors --all ~/.cache/wal/colors-kitty.conf`
