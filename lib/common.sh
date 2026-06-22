# botmesh shared helpers. POSIX-sh compatible (macOS bash 3.2). No bashisms.

# Emit a message to stderr and exit non-zero.
die() {
  printf 'botmesh: %s\n' "$*" >&2
  exit 1
}

# Log to stderr only (stdout is reserved for command output).
log() {
  [ -n "${BOTMESH_QUIET:-}" ] && return 0
  printf 'botmesh: %s\n' "$*" >&2
}

# Require an external command, or die with a helpful message.
need_cmd() {
  command -v "$1" >/dev/null 2>&1 || die "missing required command: $1"
}
