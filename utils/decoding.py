"""System module."""
import sys
import ast
import base64

def decoding(data: str) -> tuple:
    """Return decoded data."""
    try:
        if data == "":
            raise Exception
        base64_encoded_data = bytes(base64.b64encode(data))
        base64_message = str(base64_encoded_data.decode("utf-8"))
        dic = ast.literal_eval(base64_message)
        return dic
    except Exception:
        print ("Decoding error.")
        sys.exit()
        