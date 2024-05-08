# a = 1
# print(type(a))
# s = 'prince'
# print(type(s))
# m = [1,2,3,4,5]
# print(type(m))
import csv
class Item:
    pay_rate = 0.8
    all = []
    def __init__(self,name:str,price:float,quantity=0):
        ## Run validation on the received arguments
        assert price>0,f"Price {price} is not greater than zero"
        assert quantity>=0,f"Quantity {quantity} should not be a negative number"
        self.__name = name
        self.__price = price
        self.quantity = quantity
        Item.all.append(self)

    @property
    def price(self):
        return self.__price


    @property
    def name(self):
        print("We have entered into getter function")
        return self.__name
    
    @name.setter
    def name(self,value):
        print("We have entered into setter function")
        self.__name = value
        return self.__name

    def apply_discount(self):
        self.__price = self.__price*self.pay_rate

    def total_price(self):
        return self.__price*self.quantity

    def __repr__(self) -> str:
        return f"{self.__class__.__name__}('{self.name}',{self.__price},{self.quantity})"
    
    @classmethod
    def instantiate_from_csv(cls):
        with open('items.csv','r') as f:
            reader = csv.DictReader(f)
            items = list(reader)
        for item in items:
            Item(
                name = item.get('name'),
                price = float(item.get('price')),
                quantity = float(item.get('quantity'))
            )

    @staticmethod
    def is_integer(num):
        if isinstance(num,float):
            return num.is_integer()
        elif isinstance(num, int):
            return True
        else:
            return False
    
    def __message_body(self):
        return "Hi this is an email"

    def send_email(self):
        self.__message_body()


class Phone(Item):
    all = []
    pay_rate = 0.7
    def __init__(self, name: str, price: float, quantity=0,broken_phones=0):
        super().__init__(name, price, quantity)

        ## Checking the validation of broken_phones
        assert broken_phones>=0,f"Broken Phones value is negative:{broken_phones}"
        
        self.broken_phones = broken_phones
        Phone.all.append(self)


item2 = Item('Laptop',100,5)
item1 = Phone('Phone',1000,5)
item1.apply_discount()
print(item1.price)
# item2.apply_discount()
# print(item2.price)
# item2.send_email()
# item2.apply_discount()
# print(item2.price)


# item2.name = 'Computer'
# print(item2.name)
# item1= Phone('Phone',100,5)
# print(Item.all)
# print(Phone.all)

# print(item1.broken_phones)
# print(Item.is_integer(7))
# print(item1.total_price())
# print(item2.total_price())
# print(Item.all)
# item2.pay_rate = 0.7
# item2.apply_discount()
# print(item2.price)
# item1.apply_discount()
# print(item1.price)
# print(Item.pay_rate)
# print(item1.pay_rate)
# print(Item.__dict__)
# print(item1.__dict__)