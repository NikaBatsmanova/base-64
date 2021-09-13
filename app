"""File module."""
from utils.open_file import open_file
from utils.decoding import decoding
from utils.reading import reading

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
