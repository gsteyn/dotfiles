#!/usr/bin/env python3
"""Evenly distribute pane sizes in the focused herdr tab.

herdr stores panes as a binary split tree, so splitting a pane only halves
that pane (three vertical splits end up 50/25/25). This walks the tree and
sets each split's ratio so that runs of same-direction splits share space
equally, e.g. 33/33/33.
"""

import json
import os
import socket
import subprocess
import sys

SOCK = os.path.expanduser("~/.config/herdr/herdr.sock")


def call(method, params):
    with socket.socket(socket.AF_UNIX, socket.SOCK_STREAM) as s:
        s.connect(SOCK)
        s.sendall((json.dumps({"id": "equalize", "method": method, "params": params}) + "\n").encode())
        buf = b""
        while not buf.endswith(b"\n"):
            chunk = s.recv(65536)
            if not chunk:
                break
            buf += chunk
    resp = json.loads(buf)
    if "error" in resp:
        sys.exit(f"herdr {method} failed: {resp['error']}")
    return resp["result"]


def weight(node, direction):
    """Number of slots a node occupies along `direction`."""
    if node["type"] == "split" and node["direction"] == direction:
        return weight(node["first"], direction) + weight(node["second"], direction)
    return 1


def equalize(node, path, tab_id):
    if node["type"] != "split":
        return
    d = node["direction"]
    first, second = weight(node["first"], d), weight(node["second"], d)
    call("layout.set_split_ratio", {"tab_id": tab_id, "path": path, "ratio": first / (first + second)})
    # path booleans: false = first child, true = second child
    equalize(node["first"], path + [False], tab_id)
    equalize(node["second"], path + [True], tab_id)


def main():
    tab_id = sys.argv[1] if len(sys.argv) > 1 else None
    if tab_id is None:
        out = subprocess.run(["herdr", "pane", "current"], capture_output=True, text=True, check=True).stdout
        tab_id = json.loads(out)["result"]["pane"]["tab_id"]
    layout = call("layout.export", {"tab_id": tab_id})["layout"]
    equalize(layout["root"], [], tab_id)


if __name__ == "__main__":
    main()
