"""System module."""
import sys

def reading(dic: dict, key: str) -> str:
    """Check for a key in the dictionary."""
    try:
        found = bool(dic.get(key))
        if found:
            value = dic[key]
        else:
            raise Exception
    except Exception:
        print ("Key {0} not found.".format(key))
        sys.exit()
    return value
    