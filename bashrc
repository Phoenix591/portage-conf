#!/bin/bash
# (C) Martin V\"ath <martin@mvath.de>
[ "`type -t BashrcdMain`" = function ] || \
. "${PORTAGE_CONFIGROOT%/}/etc/portage/bashrc.d/bashrcd.sh"
BashrcdMain "$@"


PORTAGE_HOOKS_PREFIX=/etc/portage/hooks
PACKAGE_HOOKS_DIR="$PORTAGE_HOOKS_PREFIX/$CATEGORY/$PN"
CATEGORY_HOOKS_DIR="$PORTAGE_HOOKS_PREFIX/$CATEGORY"
function source_all() {
  if test -d "$1"; then
    for f in $1/*; do
      if test -f "$f"; then
        source "$f"
      fi
    done
  fi
}
source_all "$CATEGORY_HOOKS_DIR"
source_all "$PACKAGE_HOOKS_DIR"
