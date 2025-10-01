# ASCII Rickroll (Terminal Edition)

Runs the classic **rickroll** as an ASCII animation right in your terminal — totally offline once the frame file is present.

<p align="center">
  <a href="https://www.paypal.com/paypalme/Erenkrb"><b>💖 Donate via PayPal</b></a>
</p>

## Features
- Smooth byte-rate throttling via `pv` (with a Perl fallback).
- Works fully offline using `rickroll.txt` (included).
- No external dependencies beyond standard POSIX tools.

## Quick Start (Linux / macOS)

```bash
git clone https://github.com/yourname/ascii-rickroll.git
cd ascii-rickroll
chmod +x rickroll.sh
./rickroll.sh
```

> Tip: It loops forever. Hit `Ctrl+C` to stop.

## Run on Termux (Android)

You can run this in [**Termux**](https://termux.dev/en/) too:

1. Install Termux from **F-Droid** (recommended).  
2. Update packages:
   ```bash
   pkg update && pkg upgrade
   ```
3. Install required tools:
   ```bash
   pkg install git pv perl
   ```
4. Clone and run:
   ```bash
   git clone https://github.com/yourname/ascii-rickroll.git
   cd ascii-rickroll
   chmod +x rickroll.sh
   ./rickroll.sh
   ```

> If `pv` runs too fast/slow on your device, try the `perl` fallback by uninstalling `pv`:
> ```bash
> pkg uninstall pv
> ./rickroll.sh
> ```

## Requirements
- **Linux**, **macOS**, or **Termux (Android)**
- One of:
  - [`pv`](https://www.ivarch.com/programs/pv.shtml) installed (recommended), **or**
  - `perl` (for the fallback throttling)
- A reasonably wide terminal (80+ columns).

## How it works
- `rickroll.sh` prints the pre-recorded ASCII frames from `rickroll.txt` at a controlled **bytes-per-second** rate so the animation looks fluid.
- The default speed is set via `BPS` (bytes per second). You can tune it to match your terminal / font / machine.

## Usage

Run with defaults:

```bash
./rickroll.sh
```

Override the frame file or speed on the fly:

```bash
FILE=my_frames.txt BPS=22000 ./rickroll.sh
```

Play only once (instead of looping forever):

```bash
# Edit the script and remove the enclosing `while :; do ... done`
```

## Packaging
A simple `Makefile` is included:

```bash
make play            # run ./rickroll.sh
make speed BPS=22000 # run with a custom speed
```

## Contributing
PRs welcome! If you have a cleaner throttling approach or a smaller/better ASCII capture, open an issue or PR.

## License
MIT © 2025 Erenkrb
