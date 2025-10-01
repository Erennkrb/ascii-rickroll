#!/bin/sh
# Offline ASCII rickroll player with byte-rate throttling (no intro text)

FILE="rickroll.txt"
# Tune this until it visually matches the original (try 12000–24000)
BPS=18000

if [ ! -f "$FILE" ]; then
  echo "Missing $FILE. First run:"
  echo "  curl -s http://ascii.live/can-you-hear-me > $FILE"
  exit 1
fi

# Play forever; remove the while loop if you want a single run.
while :; do
  if command -v pv >/dev/null 2>&1; then
    # pv provides smooth throttling by bytes per second
    pv -qL "$BPS" "$FILE"
  else
    # Fallback: perl usleep throttling (~BPS bytes/sec)
    perl -e '
      use strict; use warnings;
      use Time::HiRes qw(usleep);
      my ($bps,$file) = @ARGV;
      my $chunk = 1024;
      my $delay = int(1_000_000 * $chunk / $bps); # microseconds
      open my $fh, "<:raw", $file or die "open $file: $!";
      binmode STDOUT;
      while (read $fh, my $buf, $chunk) {
        print STDOUT $buf;
        usleep($delay);
      }
    ' "$BPS" "$FILE"
  fi
done
