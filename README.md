# Hela 🚀

**Hela** – A Fastboot-style CLI tool for Samsung devices, inspired by Fastboot.  
Flash, erase, wipe, and manage your device straight from the terminal.  

Heimdall (Henrik Grimler fork) based
---

## ⚡ Features

- **Flash**: Flash specified image(s) to partition(s).  
- **Erase**: Erase a given partition (PIT + `/dev/zero`).  
- **Wipe**: Wipe `userdata`, `cache`, `metadata`, and `misc`.  
- **Devices**: Detect connected device(s).  
- **Reboot**: Reboot the device safely (close-pc-screen).  
- **Flashall**: Automatically flash all compatible files in the current directory.  

---

## 💻 Usage

```bash
hela flash [partition] [image] ...      # Flash specified image(s)
hela erase [partition]                  # Erase the given partition
hela -w                                 # Wipe userdata, cache, metadata, and misc
hela devices                            # Detect connected device(s)
hela reboot                             # Reboot the device
hela flashall                            # Automatically flash all files in current directory
hela help                               # Display help menu
```
---

**✅ Tip:** Always run hela devices first to make sure your device is detected.  
**⚠️ Warning:** Flashing partitions incorrectly can brick your device. Use with caution.  

---

## 🛠 Installation

```bash
git clone https://github.com/av2xn/Hela.git
cd Hela
chmod +x *
./setup.sh
```

[XDA](https://xdaforums.com/t/tool-hela-fastboot-style-flashing-tool-for-samsung-heimdall-based-only-works-on-linux.4752037/)  
[Technopat](https://www.technopat.net/sosyal/konu/hela-linux-uezerinde-calisan-samsung-flash-tool-hela.3862472/)
