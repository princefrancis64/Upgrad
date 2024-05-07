# item1 = 'Phone'
# item1_price = 100
# item1_quantity = 5
# item1_price_total = item1_price*item1_quantity

# print(type(item1))
# print(type(item1_price))
# print(type(item1_quantity))
# print(type(item1_price_total))


# class Item:

#     def __init__(self,name,price,quantity):
#         self.name = name
#         self.price = price
#         self.quantity = quantity
#         # print(f"An instance created:{name}")
#     def calculate_total_price(self,x,y):
#         return x*y


# item1 = Item('Phone',100,5)

## Creating attributes
# item1.name = 'Phone'
# item1.price=100
# item1.quantity = 5


# print(type(item1))
# print(type(item1.name))
# print(type(item1.price))
# print(type(item1.quantity))

# print(item1.calculate_total_price(item1.price,item1.quantity))


# item2 = Item('Laptop',1000,3)
# item2.name = 'Laptop'
# item2.price=1000
# item2.quantity = 3

# print(item2.calculate_total_price(item2.price,item2.quantity))

# print(item1.name)
# print(item2.name)

# print(item1.calculate_total_price(item1.price,item1.quantity))



# class Item:
#     def __init__(self:str,name,price:float,quantity=0):
#         #Run validation to received arguments
#         assert price>=0, f"Price: {price} is not greater than 0"
#         assert quantity>=0, f"Quantity:{quantity} is not greater than 0"

#         #Assign to self object
#         self.name = name
#         self.price = price
#         self.quantity = quantity

#     def calculate_total_price(self):
#         return self.price*self.quantity

# item1 = Item('Phone',100,5)
# item2 = Item('Laptop',1000,3)

# item2.has_numpad= False
# print(item1.calculate_total_price())
# print(item2.calculate_total_price())
# print(item2.has_numpad)
# print(item1.quantity)
# print(item2.quantity)


# class Item:
#     def __init__(self,name:str,price:float,quantity=0):
#         assert price>0, f"Price:{price} should be greater than 0"
#         self.name = name
#         self.price = price
#         self.quantity = quantity

#     def calculate_total_sales(self):
#         return self.price*self.quantity
    

# item1 = Item('Phone',100,3)
# print(item1.calculate_total_sales())



# class Item:
#     pay_rate = 0.8
#     def __init__(self,name:str,price:float,quantity=0):
#         assert price>0, f"Price:{price} should be greater than 0"
#         assert quantity>0,f"Quantity:{quantity} should be greater than 0"
#         self.name = name
#         self.price = price
#         self.quantity = quantity

#     def calculate_total_sales(self):
#         return self.price*self.quantity
    
#     def apply_discount(self):
#         self.price = self.pay_rate*self.price

# item1= Item('Phone',100,3)
# item2 = Item('Laptop',1000,3)

# item2.pay_rate = 0.7
# item2.apply_discount()
# item1.apply_discount()
# print(item1.price)
# print(item2.price)


# item1.apply_discount()
# print(item1.price)

# print(Item.pay_rate)
# print(item1.pay_rate)
# print(item2.pay_rate)

# print(Item.__dict__)
# print(item1.__dict__)

# import csv
# class Item:
#     pay_rate = 0.8
#     all = []
#     def __init__(self,name:str,price:float,quantity=0):
#         #Run validation to the received arguments
#         assert price>0, f"Price:{price} should be greater than 0"
#         assert quantity>0,f"Quantity:{quantity} should be greater than 0"

#         # Assign to self object
#         self.name = name
#         self.price = price
#         self.quantity = quantity

#         #Actions to execute
#         Item.all.append(self)

#     def calculate_total_sales(self):
#         return self.price*self.quantity
    
#     def apply_discount(self):
#         self.price = self.pay_rate*self.price

#     @classmethod
#     def instantiate_from_csv(cls):
#         with open('items.csv','r') as f:
#             reader = csv.DictReader(f)
#             items = list(reader)

#         for item in items:
#             Item(
#                 name = item.get('name'),
#                 price = float(item.get('price')),
#                 quantity=float(item.get('quantity'))
#             )

#     @staticmethod
#     def is_integer(num):
#         #We will count out the floats that are point 0
#         # For i.e:5.0, 10.0
#         if isinstance(num,float):
#             #Count out the floats that are point zero
#             return num.is_integer()
#         elif isinstance(num,int):
#             return True
#         else:
#             return False


#     def __repr__(self):
#         return f"Item('{self.name}',{self.price},{self.quantity})"

# print(Item.all)
# print(item1.is_integer(7))


# print(Item.is_integer(7))





# if isinstance(7.1,float):
#     print('hi')
#     print(7.1.is_integer())



# Item.instantiate_from_csv()
# print(Item.all)

# d = {'name': 'Phone', 'price': '100', 'quantity': '1'}
# print(d.get('name'))
# with open('items.csv','r') as f:
#     reader = csv.DictReader(f)
#     items = list(reader)

# for item in items:
#     print(item)
# item1 = Item('Phone',100,1)
# item2 = Item('Laptop',1000,3)
# item3 = Item('Cable',10,5)
# item4 = Item('Mouse',50,5)
# item5 = Item('keyboard',75,5)


# print(item1)
# print(Item.all)
# for instance in Item.all:
#     print(instance.name)






# import csv
# class Item:
    # pay_rate = 0.8
    # all = []
    # def __init__(self,name:str,price:float,quantity=0):
    #     #Run validation to the received arguments
    #     assert price>0, f"Price:{price} should be greater than 0"
    #     assert quantity>0,f"Quantity:{quantity} should be greater than 0"

    #     # Assign to self object
    #     self.name = name
    #     self.price = price
    #     self.quantity = quantity

    #     #Actions to execute
    #     Item.all.append(self)

    # def calculate_total_sales(self):
    #     return self.price*self.quantity
    
    # def apply_discount(self):
    #     self.price = self.pay_rate*self.price

    # @classmethod
    # def instantiate_from_csv(cls):
    #     with open('items.csv','r') as f:
    #         reader = csv.DictReader(f)
    #         items = list(reader)

    #     for item in items:
    #         Item(
    #             name = item.get('name'),
    #             price = float(item.get('price')),
    #             quantity=float(item.get('quantity'))
    #         )

    # @staticmethod
    # def is_integer(num):
    #     #We will count out the floats that are point 0
    #     # For i.e:5.0, 10.0
    #     if isinstance(num,float):
    #         #Count out the floats that are point zero
    #         return num.is_integer()
    #     elif isinstance(num,int):
    #         return True
    #     else:
    #         return False


    # def __repr__(self):
    #     return f"{self.__class__.__name__}('{self.name}',{self.price},{self.quantity})"

# class Phone(Item):
    # all = [] 
#     def __init__(self,name:str,price:float,quantity=0,broken_phones=0):
#         #Call to super function to have access to all attributes/ methods
#         super().__init__(
#             name, price, quantity
#             )

#         #Run validation to the received arguments
#         assert broken_phones>=0, f"Broken Phones {broken_phones} is not greater than 0"

#         #Assing to self objects
#         self.broken_phones= broken_phones

# phone1 = Phone('jscPhonev10',500,5)
# # phone2 = Phone('jscPhonev20',700,5)
# print(Item.all)
# print(Phone.all)


# phone1 = Item('jscPhonev10',500,5)
# phone1.broken_phone=1
# phone2 = Item('jscPhonev20',700,5)
# phone2.broken_phone=1



# from item import Item
# from phone import Phone

# Item.instantiate_from_csv()
# print(Item.all)


# item1 = Item('MyItem',750,6)

# print(item1.__connect)



# item1.price = 900
# item1.apply_increment(0.20)
# print(item1.price)


# item1.name = 'OtherItem'
# item1.__name = 'OtherItem'
# print(item1.name)



# item1.read_only_name = "BBB"
# print(item1.read_only_name)
# print(item1.name)
# print(item1.name)



from phone import Phone
item1 = Phone('jscPhone',1000,3)
item1.apply_discount()
print(item1.price)
# item1.apply_increment(0.5)
# print(item1.price)
# item1.send_email()