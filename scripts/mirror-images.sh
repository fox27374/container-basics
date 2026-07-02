#!/usr/bin/env bash
#
# mirror-images.sh
#
# Pulls all upstream container images used in this repo, retags them for the
# local registry (cr.lab.local) and pushes them there. Useful as a fallback
# when Docker Hub rate limits are hit during the labs.
#
# Usage:
#   ./scripts/mirror-images.sh                # pull, tag and push everything
#   REGISTRY=cr.lab.local:5000 ./scripts/mirror-images.sh
#   ./scripts/mirror-images.sh --no-push      # pull and tag only (skip push)
#
set -euo pipefail

# A REGISTRY set in the environment takes precedence over the config file.
REGISTRY_OVERRIDE="${REGISTRY:-}"

# Load registry and image list from the config file next to this script.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_FILE="${CONFIG_FILE:-${SCRIPT_DIR}/mirror-images.conf}"

if [[ ! -f "$CONFIG_FILE" ]]; then
    echo "ERROR: config file not found: ${CONFIG_FILE}" >&2
    exit 1
fi

# shellcheck source=mirror-images.conf
source "$CONFIG_FILE"

# Apply the environment override (if any), else fall back to the config value.
REGISTRY="${REGISTRY_OVERRIDE:-${REGISTRY:-cr.lab.local}}"

if [[ ${#IMAGES[@]} -eq 0 ]]; then
    echo "ERROR: no images defined in ${CONFIG_FILE}" >&2
    exit 1
fi

PUSH=true
if [[ "${1:-}" == "--no-push" ]]; then
    PUSH=false
fi

# Strip a leading registry (e.g. docker.io/) so we can rebuild the ref under
# the local registry: docker.io/library/nginx:alpine -> nginx:alpine
strip_registry() {
    local ref="$1"
    # Remove a leading "registry.host/" only if the first path element looks
    # like a hostname (contains a dot or a colon).
    if [[ "$ref" == */* ]]; then
        local first="${ref%%/*}"
        if [[ "$first" == *.* || "$first" == *:* ]]; then
            echo "${ref#*/}"
            return
        fi
    fi
    echo "$ref"
}

echo "Target registry: ${REGISTRY}"
echo "Push after tagging: ${PUSH}"
echo

failed=()

for src in "${IMAGES[@]}"; do
    repo_tag="$(strip_registry "$src")"
    dest="${REGISTRY}/${repo_tag}"

    echo "==> ${src}"

    echo "    pulling..."
    if ! podman pull "$src"; then
        echo "    ERROR: pull failed" >&2
        failed+=("$src (pull)")
        continue
    fi

    echo "    tagging -> ${dest}"
    if ! podman tag "$src" "$dest"; then
        echo "    ERROR: tag failed" >&2
        failed+=("$src (tag)")
        continue
    fi

    if [[ "$PUSH" == true ]]; then
        echo "    pushing -> ${dest}"
        if ! podman push "$dest"; then
            echo "    ERROR: push failed" >&2
            failed+=("$dest (push)")
            continue
        fi
    fi

    echo "    done"
    echo
done

if [[ ${#failed[@]} -gt 0 ]]; then
    echo "Completed with errors:" >&2
    printf '  - %s\n' "${failed[@]}" >&2
    exit 1
fi

echo "All images mirrored to ${REGISTRY} successfully."
