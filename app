"""System module."""
import sys
import base64
import ast
import io

def open_file(file_name: str) -> str:
    """Return configuration file data."""
    try:
        file = io.open(file_name, "r", encoding="utf-8")
        return file.read()
    except FileNotFoundError:
        print ("File not found.")
        sys.exit()

def decoding(data: str) -> tuple:
    """Return decoded data."""
    try:
        if file_data == "":
            raise Exception
        base64_encoded_data = bytes(base64.b64decode(data))
        base64_message = str(base64_encoded_data.decode("utf-8"))
        dic = ast.literal_eval(base64_message)
        return dic
    except Exception:
        print ("Decoding error.")
        sys.exit()

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

FILENAME = str("base64.txt")
file_data = open_file(FILENAME)
dictionary = decoding(file_data)
cars = reading(dictionary, "cars")
customers = reading(dictionary, "customers")
for car in cars:
    for customer in customers:
        price = int(reading(car, "price"))
        balance = int(reading(customer, "balance"))
        if price/100 <= balance:
            brand = reading(car, "brand")
            model = reading(car, "model")
            firstname = reading(customer, "firstname")
            lastname = reading(customer, "lastaname")
            print("Car {0} {1} can be offered for {2} {3}.".format(brand, model, firstname, lastname))
