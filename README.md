# Hela

Hela - A Fastboot-style CLI for Odin

Usage:
  hela flash [partition] [image] ...     -> Flash specified image(s)
  
  hela erase [partition]                -> Erase the given partition (PIT + /dev/zero)
  
  hela -w                                -> Wipe userdata, cache, metadata, and misc
  
  hela devices                           -> Detect connected device
  
  hela reboot                            -> Reboot device using close-pc-screen
  
  hela flashall                          -> Automatically flash all files in the current directory
  
  hela help                              -> Display this help menu

For install:

git clone https://github.com/av2xn/Hela.git

cd Hela

chmod +x *

./setup.sh #sorry but setup.sh is turkhis .d

For uninstall:

./uninstaller.sh
