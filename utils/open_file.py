"""System module."""
import sys
import io

def open_file(file_name: str) -> str:
    """Return configuration file data."""
    try:
        file = io.open(file_name, "r", encoding="utf-8")
        return file.read()
    except FileNotFoundError:
        print ("File not found.")
        sys.exit()
        