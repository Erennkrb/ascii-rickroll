# ASCII Rickroll (Terminal Edition)

Runs the classic **rickroll** as an ASCII animation right in your terminal — totally offline once the frame file is present.

<p align="center">
  <a href="https://www.paypal.com/paypalme/Erenkrb"><b>Donate via PayPal</b></a>
</p>

## Features
- Smooth byte-rate throttling via `pv` (with a Perl fallback).
- Works fully offline using `rickroll.txt` (included).
- No external dependencies beyond standard POSIX tools.

## Quick Start

```bash
git clone https://github.com/Erennkrb/ascii-rickroll.git
cd ascii-rickroll
chmod +x rickroll.sh
./rickroll.sh
