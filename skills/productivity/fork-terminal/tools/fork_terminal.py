#!/usr/bin/env -S uv run
"""Fork a new terminal window with a command."""

import os
import platform
import subprocess


def fork_terminal(command: str) -> str:
    """Open a new Terminal window and run the specified command."""
    system = platform.system()
    cwd = os.getcwd()

    if system == "Darwin":  # macOS
        # Build shell command - use single quotes for cd to avoid escaping issues
        # Then escape everything for AppleScript
        shell_command = f"cd '{cwd}' && {command}"
        # Escape for AppleScript: backslashes first, then quotes
        escaped_shell_command = shell_command.replace("\\", "\\\\").replace('"', '\\"')

        try:
            result = subprocess.run(
                ["osascript", "-e", f'tell application "Terminal" to do script "{escaped_shell_command}"'],
                capture_output=True,
                text=True,
            )
            output = f"stdout: {result.stdout.strip()}\nstderr: {result.stderr.strip()}\nreturn_code: {result.returncode}"
            return output
        except Exception as e:
            return f"Error: {str(e)}"

    elif system == "Windows":
        # Use /d flag to change drives if necessary
        full_command = f'cd /d "{cwd}" && {command}'
        subprocess.Popen(["cmd", "/c", "start", "cmd", "/k", full_command], shell=True)
        return "Windows terminal launched"

    else:  # Linux and others
        raise NotImplementedError(f"Platform {system} not supported")


if __name__ == "__main__":
    import sys
    if len(sys.argv) > 1:
        output = fork_terminal(" ".join(sys.argv[1:]))
        print(output)
