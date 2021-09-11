import base64
import ast
with open('base64.txt', 'r') as file:
    file_data = file.read().encode("ascii")
    base64_encoded_data = base64.b64decode(file_data)
    base64_message = base64_encoded_data.decode('utf-8')
dic = ast.literal_eval(base64_message)
cars = dic['cars']
customers = dic['customers']
for car in cars:
    for customer in customers:
        if car['price']/100 <= customer['balance']:
            print("Car {0} {1} can be offered for {2} {3}.".format(car["brand"], car["model"], customer["firstname"], customer["lastaname"]))
