#!/usr/bin/env bash
# search_policy.sh — Full-text search across the Phoenix Help policy library.
#
# Usage:
#   ./search_policy.sh "adult day health"            # list which docs mention the term
#   ./search_policy.sh --lines "hiv/aids waiver"     # show the matching lines + doc
#   ./search_policy.sh --open "sex offender"         # list + print the TOP matching file paths
#   ./search_policy.sh --counts "exception code"     # list docs with per-file match counts
#
# Tips:
#   - Quotes around multi-word phrases get more useful hits.
#   - grep is case-insensitive by default here.
#   - Every PDF has a sibling .txt (full text), so searching text = searching the policy.

LIB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MODE="list"

case "$1" in
  --lines)  MODE="lines";  shift ;;
  --open)   MODE="open";   shift ;;
  --counts) MODE="counts"; shift ;;
esac

if [ -z "$*" ]; then
  echo "Usage: $0 [--lines|--open|--counts] \"search term\""
  exit 1
fi

TERM="$*"

case "$MODE" in
  list)
    echo "=== Docs matching: $TERM ==="
    grep -ril "$TERM" "$LIB_DIR" --include='*.txt' | sed "s|$LIB_DIR/||" | sort
    ;;

  lines)
    echo "=== Matching lines: $TERM ==="
    grep -rin "$TERM" "$LIB_DIR" --include='*.txt' | sed "s|$LIB_DIR/||"
    ;;

  open)
    echo "=== Top matching files: $TERM ==="
    grep -ril "$TERM" "$LIB_DIR" --include='*.txt' | sed "s|$LIB_DIR/||" | sort
    echo ""
    echo "Open the corresponding PDF in: $LIB_DIR"
    echo "(each .txt has a sibling .pdf of the same name)"
    ;;

  counts)
    echo "=== Per-file match counts: $TERM ==="
    grep -ric "$TERM" "$LIB_DIR" --include='*.txt' | grep -v ':0$' | sed "s|$LIB_DIR/||" | sort -t: -k2 -rn
    ;;
esac
