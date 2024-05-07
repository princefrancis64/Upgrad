import csv
class Item:
    pay_rate = 0.8
    all = []
    def __init__(self,name:str,price:float,quantity=0):
        #Run validation to the received arguments
        assert price>0, f"Price:{price} should be greater than 0"
        assert quantity>0,f"Quantity:{quantity} should be greater than 0"

        # Assign to self object
        self.__name = name
        self.__price = price
        self.quantity = quantity

        #Actions to execute
        Item.all.append(self)

    @property
    def price(self):
        return self.__price

    def apply_discount(self):
        self.__price = self.pay_rate*self.__price

    def apply_increment(self,increment_value):
        self.__price = self.__price + self.price*increment_value

    @property
    # Property decorator = Read Only Attribute
    def name(self):
        return self.__name
    

    @name.setter
    def name(self,value):
        # assert len(Value)<5,"Please reduce the length"
        if len(value)>10:
            raise Exception("The name is too long!")
        else:
            self.__name=value

    def calculate_total_sales(self):
        return self.__price*self.quantity
    

    @classmethod
    def instantiate_from_csv(cls):
        with open('items.csv','r') as f:
            reader = csv.DictReader(f)
            items = list(reader)

        for item in items:
            Item(
                name = item.get('name'),
                price = float(item.get('price')),
                quantity=float(item.get('quantity'))
            )

    @staticmethod
    def is_integer(num):
        #We will count out the floats that are point 0
        # For i.e:5.0, 10.0
        if isinstance(num,float):
            #Count out the floats that are point zero
            return num.is_integer()
        elif isinstance(num,int):
            return True
        else:
            return False


    def __repr__(self):
        return f"{self.__class__.__name__}('{self.name}',{self.__price},{self.quantity})"
    

    @property
    def read_only_name(self):
        return "AAA"

    def __connect(self,smtp_server):
        pass


    def __prepare_body(self):
        return f"""
        Hello someone.
        We have {self.__name} {self.quantity} times.
        Regards,
        Prince
        """
    
    def __send_body(self):
        pass

    def send_email(self):
        self.__connect("adfadf")
        print(self.__prepare_body())
        self.__send_body()