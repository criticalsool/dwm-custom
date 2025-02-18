<div align="center">
  <img src="./dwm.png" width="195" height="90"/>

  # dwm - dynamic window manager
  ### dwm is an extremely ***fast***, ***small***, and ***dynamic*** window manager for X.

</div>

---

This is my **personal** dwm setup with following patches:

- [cool autostart](https://dwm.suckless.org/patches/cool_autostart/)
- [azerty](https://dwm.suckless.org/patches/azerty/)
- custom keybindings and colors (see [dwm/config.def.h](dwm/config.def.h) for more details)
- [hide vacant tags](https://dwm.suckless.org/patches/hide_vacant_tags/)
- [noborder](https://dwm.suckless.org/patches/noborder/)
- [pertag](https://dwm.suckless.org/patches/pertag/)
- [warp](https://dwm.suckless.org/patches/warp/)

## Installation
```bash
git clone https://github.com/criticalsool/dwm-custom.git && \
cd dwm-custom/ && \
bash dwm.bash
```

> [!NOTE]
> [dwm.bash](./dwm.bash) will install the dependencies, compile and install **dwl**, **dmenu** and **slstatus**

> [!TIP]
> [from_minimal.bash](./from_minimal.bash) will start from a minimal Debian or Archlinux CLI installation and install and configure [**xorg**](https://www.x.org/wiki/) and [**greetd**](https://git.sr.ht/~kennylevinsen/greetd) in addition to execute [dwm.bash](./dwm.bash)

```bash
git clone https://github.com/criticalsool/dwm-custom.git && \
cd dwm-custom/ && \
bash from_minimal.bash
```

> [!CAUTION]
> It will also configure autologin and install a bunch of packages you might not want, to work with my dwm configuration. Please **read it** before


## Tips
- flatpak application in **dmenu**
```bash
sudo ln -s /var/lib/flatpak/exports/bin/io.freetubeapp.FreeTube /usr/bin/freetube
```

## Thanks
- [suckless](https://suckless.org/) team for [dwm](https://dwm.suckless.org/), [dmenu](https://tools.suckless.org/dmenu/) and [slstatus](https://tools.suckless.org/slstatus/)
- [dwm patches contributors](https://dwm.suckless.org/patches)
- [xorg](https://www.x.org/wiki/) & [greetd](https://git.sr.ht/~kennylevinsen/greetd)
- [ChrisTitusTech/dwm-titus](https://github.com/ChrisTitusTech/dwm-titus)
- Reddit, GitHub and Stackoverflow platforms & users