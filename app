import base64
import ast
import io
import sys

def open_file(file_name):
    try:
        file = io.open(file_name, "r")
        return file.read()
    except FileNotFoundError:
        print ("Файл не найден.")
        sys.exit()

def decoding(data):
    try:
        file_data = data.encode("ascii")
        if file_data == "":
            raise Exception
        base64_encoded_data = base64.b64decode(file_data)
        base64_message = base64_encoded_data.decode("utf-8")
        dic = ast.literal_eval(base64_message)
        return dic
    except Exception:
        print ("Ошибка декодирования.")
        sys.exit()

def reading(dic, key):
    try:
        found = dic.get(key)
        if found:
            value = dic[key]
            return value
        else:
            raise Exception
    except Exception:
        print ("Ключ {0} не найден.".format(key))
        sys.exit()

file_name = "base64.txt"
file_data = open_file(file_name)
dictionary = decoding(file_data)
cars = reading(dictionary, "cars")
customers = reading(dictionary, "customers")
for car in cars:
    for customer in customers:
        price = reading(car, "price")
        balance = reading(customer, "balance")
        if price/100 <= balance:
            brand = reading(car, "brand")
            model = reading(car, "model")
            firstname = reading(customer, "firstname")
            lastaname = reading(customer, "lastaname")
            print("Car {0} {1} can be offered for {2} {3}.".format(brand, model, firstname, lastaname))

