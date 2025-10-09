#!/usr/bin/env bash
# toggle-performance: Toggle tuned between throughput-performance and balanced

ACTIVE_PROFILE=$(tuned-adm active | awk '/Profile/{print $4}')

if [[ "$ACTIVE_PROFILE" == "throughput-performance" ]]; then
  echo "Switching to balanced profile..."
  sudo tuned-adm profile balanced
  sudo cpupower frequency-set -g powersave
  notify-send "Performance mode" "Switched to BALANCED"
else
  echo "Switching to performance profile..."
  sudo tuned-adm profile throughput-performance
  sudo cpupower frequency-set -g performance
  notify-send "Performance mode" "Switched to THROUGHPUT-PERFORMANCE"
fi
