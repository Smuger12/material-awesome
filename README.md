# Material and Mouse driven theme for [AwesomeWM 4.3](https://awesomewm.org/)
## Original work by PapyElGringo, official development seem to have moved to [material-shell](https://github.com/PapyElGringo/material-shell)

Note: Chris Titus Tech moved his fork to [titus-awesome](https://github.com/ChrisTitusTech/titus-awesome).

Note v2: I'm currently not using this config.

An almost desktop environment made with [AwesomeWM](https://awesomewm.org/) following the [Material Design guidelines](https://material.io) with a performant opiniated mouse/keyboard workflow to increase daily productivity and comfort.

[![](./theme/PapyElGringo-theme/demo.gif?raw=true)](https://www.reddit.com/r/unixporn/comments/anp51q/awesome_material_awesome_workflow/)
*[Click to view in high quality](https://www.reddit.com/r/unixporn/comments/anp51q/awesome_material_awesome_workflow/)*

| Tiled         | Panel         | Exit screen   |
|:-------------:|:-------------:|:-------------:|
|![](https://i.imgur.com/fELCtep.png)|![](https://i.imgur.com/7IthpQS.png)|![](https://i.imgur.com/rcKOLYQ.png)|

## Installation

### 1) Get all the dependencies

#### Install instructions for Arch Linux (if you have a different distribution, just compile/download from your distro repos the rest of the packages - links in *Program list*)

```
yay --needed -S awesome rofi picom-jonaburg-git betterlockscreen ttf-roboto gnome-polkit qt5-styleplugins materia-gtk-theme papirus-icon-theme lxappearance-gtk3 flameshot pnmixer-gtk3 pavucontrol network-manager-applet xorg-xbacklight xfce4-power-manager -y
```

### Program list

- [AwesomeWM](https://awesomewm.org/) - as the window manager.
- [Roboto](https://fonts.google.com/specimen/Roboto) - as the **font**.
- [rofi](https://github.com/DaveDavenport/rofi) - for the app launcher.
- [picom-jonaburg](https://github.com/jonaburg/picom) - picom fork with **cool animations and rounded corners!**.
- [betterlockscreen](https://github.com/pavanjadhaw/betterlockscreen) - as the lockscreen (can be replaced by whichever you want, just remember to edit the apps.lua file).
- gnome-polkit - recommend using the gnome-polkit as it integrates nicely for elevating programs that need root access.
- [Materia](https://github.com/nana-4/materia-theme) - as GTK theme (or whatever you want).
- [Papirus Dark](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme) - as icon theme (or whatever you want).
- [lxappearance](https://sourceforge.net/projects/lxde/files/LXAppearance/) - to set up the GTK and icon theme.
- [pavucontrol](https://freedesktop.org/software/pulseaudio/pavucontrol/) - audio control.
- [xbacklight](https://www.x.org/archive/X11R7.5/doc/man/man1/xbacklight.1.html) - for adjusting brightness on laptops.
- [flameshot](https://flameshot.js.org/#/) - as screenshot utility (can be replaced by whichever you want, just remember to edit the apps.lua file).
- [pnmixer](https://github.com/nicklan/pnmixer) - audio systray.
- [network-manager-applet](https://gitlab.gnome.org/GNOME/network-manager-applet) - Network Manager systray.
- [xfce4-power-manager](https://docs.xfce.org/xfce/xfce4-power-manager/start) - great way of dealing with sleep, monitor timeout, and other power management features.

### 2) Clone the configuration

```bash
git clone https://github.com/Smuger12/material-awesome.git ~/.config/awesome
```

### 3) Set the themes

Start `lxappearance` to active the **icon** theme and **GTK** theme
Note: for cursor theme, edit `~/.icons/default/index.theme` and `~/.config/gtk3-0/settings.ini`, for the change to also show up in applications run as root, copy the 2 files over to their respective place in `/root`.

### 4) Same theme for Qt/KDE applications and GTK applications, and fix missing indicators

First install qt5-styleplugins (Arch) and add this to the bottom of your `/etc/environment`

```bash
XDG_CURRENT_DESKTOP=Unity
QT_QPA_PLATFORMTHEME=gtk2
```

The first variable fixes most systrays (especially Electron based ones!), the second tells Qt and KDE applications to use your GTK2 theme set through lxappearance.

### 5) Read the documentation

The documentation live within the source code.

The project is split in functional directories and in each of them there is a readme where you can get additional information about the them.

* [Configuration](./configuration) is about all the **settings** available
* [Layout](./layout) hold the **disposition** of all the widgets
* [Module](./module) contain all the **features** available
* [Theme](./theme) hold all the **aesthetic** aspects
* [Widget](./widget) contain all the **widgets** available
