"""System module."""
import sys
import ast
import base64

class EmptyFile(Exception):
    """Base class for exceptions."""
    pass

def decoding(data: str) -> tuple:
    """Return decoded data."""
    try:
        if data == "":
            raise EmptyFile
        base64_encoded_data = bytes(base64.b64encode(data))
        base64_message = str(base64_encoded_data.decode("utf-8"))
        dic = ast.literal_eval(base64_message)
        return dic
    except TypeError:
        print ("Decoding error.")
        sys.exit()
    except EmptyFile:
        print ("Empty File.")
        sys.exit()
        
