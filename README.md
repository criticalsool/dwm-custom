<div align="center">
  <img src="./dwm.png" width="195" height="90"/>

  # dwm - dynamic window manager
  ### dwm is an extremely ***fast***, ***small***, and ***dynamic*** window manager for X.

</div>

---
### Version : 6.5

This is my **personal** dwm setup with following patches:

- [azerty](https://dwm.suckless.org/patches/azerty/)
- [custom keybindings and colors](./dwm-custom-20250213-6.5.diff)
- [hide vacant tags](https://dwm.suckless.org/patches/hide_vacant_tags/)
- [noborder](https://dwm.suckless.org/patches/noborder/)
- [pertag](https://dwm.suckless.org/patches/pertag/)
- [warp](https://dwm.suckless.org/patches/warp/)

## Installation
Download
```bash
git clone https://github.com/criticalsool/dwm-custom.git
```
Build and install dwm
```bash
cd dwm/
make
sudo make install
```
Build and install dmenu
```bash
cd ../dmenu/
make
sudo make install
```
Build and install slstatus
```bash
cd ../slstatus/
make
sudo make install
```

## Thanks
- [suckless](https://suckless.org/) team for [dwm](https://dwm.suckless.org/), [dmenu](https://tools.suckless.org/dmenu/) and [slstatus](https://tools.suckless.org/slstatus/)
- [dwm patches contributors](https://dwm.suckless.org/patches)
- [ChrisTitusTech/dwm-titus](https://github.com/ChrisTitusTech/dwm-titus)