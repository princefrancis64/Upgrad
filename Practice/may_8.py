# # a = 1
# # print(type(a))
# # s = 'prince'
# # print(type(s))
# # m = [1,2,3,4,5]
# # print(type(m))
# import csv
# class Item:
#     pay_rate = 0.8
#     all = []
#     def __init__(self,name:str,price:float,quantity=0):
#         ## Run validation on the received arguments
#         assert price>0,f"Price {price} is not greater than zero"
#         assert quantity>=0,f"Quantity {quantity} should not be a negative number"
#         self.__name = name
#         self.__price = price
#         self.quantity = quantity
#         Item.all.append(self)

#     @property
#     def price(self):
#         return self.__price


#     @property
#     def name(self):
#         print("We have entered into getter function")
#         return self.__name
    
#     @name.setter
#     def name(self,value):
#         print("We have entered into setter function")
#         self.__name = value
#         return self.__name

#     def apply_discount(self):
#         self.__price = self.__price*self.pay_rate

#     def total_price(self):
#         return self.__price*self.quantity

#     def __repr__(self) -> str:
#         return f"{self.__class__.__name__}('{self.name}',{self.__price},{self.quantity})"
    
#     @classmethod
#     def instantiate_from_csv(cls):
#         with open('items.csv','r') as f:
#             reader = csv.DictReader(f)
#             items = list(reader)
#         for item in items:
#             Item(
#                 name = item.get('name'),
#                 price = float(item.get('price')),
#                 quantity = float(item.get('quantity'))
#             )

#     @staticmethod
#     def is_integer(num):
#         if isinstance(num,float):
#             return num.is_integer()
#         elif isinstance(num, int):
#             return True
#         else:
#             return False
    
#     def __message_body(self):
#         return "Hi this is an email"

#     def send_email(self):
#         self.__message_body()


# class Phone(Item):
#     all = []
#     pay_rate = 0.7
#     def __init__(self, name: str, price: float, quantity=0,broken_phones=0):
#         super().__init__(name, price, quantity)

#         ## Checking the validation of broken_phones
#         assert broken_phones>=0,f"Broken Phones value is negative:{broken_phones}"
        
#         self.broken_phones = broken_phones
#         Phone.all.append(self)


# item2 = Item('Laptop',100,5)
# item1 = Phone('Phone',1000,5)
# item1.apply_discount()
# print(item1.price)
# # item2.apply_discount()
# # print(item2.price)
# # item2.send_email()
# # item2.apply_discount()
# # print(item2.price)


# # item2.name = 'Computer'
# # print(item2.name)
# # item1= Phone('Phone',100,5)
# # print(Item.all)
# # print(Phone.all)

# # print(item1.broken_phones)
# # print(Item.is_integer(7))
# # print(item1.total_price())
# # print(item2.total_price())
# # print(Item.all)
# # item2.pay_rate = 0.7
# # item2.apply_discount()
# # print(item2.price)
# # item1.apply_discount()
# # print(item1.price)
# # print(Item.pay_rate)
# # print(item1.pay_rate)
# # print(Item.__dict__)
# # print(item1.__dict__)


# balance = 0

# def main():
#     print("Balance:",balance)
#     deposit(100)
#     print("Balance:",balance)
#     withdraw(50)
#     print("Balance:",balance)

# def deposit(money):
#     global balance
#     balance+=money
#     return balance

# def withdraw(money):
#     global balance
#     balance-=money
#     return balance



# class Account:
#     def __init__(self):
#         self.balance=0

#     def deposit(self,money):
#         self.balance+= money

#     def withdraw(self,money):
#         self.balance-= money


# def main():
#     prince = Account()
#     prince.deposit(100)
#     prince.withdraw(50)
#     print(prince.balance)


# if __name__=="__main__":
#     main()


# import re
# name = input("What's your name?").strip()
# matches = re.search(r"^(.+),*(.+)$",name)
# print(matches.groups())
# # last,first = re.search(r"^(.+),*(.+)$",name)
# # print(f"Full name:{first}, {last}")

# import re
# email = input("What's your email:").strip()
# if re.search(r"^\w+@\w+\.edu$",email):
#     print("valid")
# else:
#     print("invalid")

# if re.search(r"^[^@]+@[^@]+\.edu$",email):
#     print("valid")
# else:
#     print("invalid")


# username,domain = email.split("@")


# if username and domain.endswith(".edu"):
#     print("valid")
# else:
#     print("invalid")

# name = input("What's your name?")

# match name:
#     case "Harry":
#         print("Gryffindor")
#     case "Hermione":
#         print("Gryffindor")
#     case "Ron":
#         print("Gryffindor")
#     case "Draco":
#         print("Slytherin")
#     case _:
#         print("Who?")

# match name:
#     case "Harry":
#         print("Gryffindor")
#     case "Hermione":
#         print("Gryffindor")
#     case "Ron":
#         print("Gryffindor")
#     case "Draco":
#         print("Slytherin")
#     case _:
#         print("Who?")

# match name:
#     case "Harry":
#         print("Gryffindor")
#     case "Hermione":
#         print("Gryffindor")
#     case "Ron":
#         print("Gryffindor")
#     case "Draco":
#         print("Slytherin")
#     case _:
#         print("Who?")


# name = input("What's your name?")

# match name:
#     case "Harry"|"Ron"|"Hermione":
#         print("Gryffindor")
#     case "Draco":
#         print("Slytherin")
#     case _:
#         print("Who?")



# name = input("what's your name?")

# match name:
#     case "Harry"|"Ron"|"Hermione":
#         print("Gryffindor")
#     case "Draco":
#         print("Slytherin")
#     case _:
#         print("Who?")



# def get_int():
#     while True:
#         try:
#             x = int(input("Enter the number"))
#             return x
#         except ValueError:
#             print("x is not an integer")
        
# get_int()


# import random
# cards = ["jack","queen","king"]
# random.shuffle(cards)
# print(cards)
# from random import choice
# number = random.randint(1,10)
# print(number)
# coin = choice(['Heads',"Tail"])
# print(coin)


# import sys

# first, last = sys.argv[1:]
# print(first,last)
# for first,last in sys.argv[1:]:
#     print(f"My name is {first} {last}")
# print(type(sys.argv[1]))

# print(len(sys.argv[1]))


# try:
#     print("My name is:",sys.argv[1])
# except IndexError:
#     print("too few arguments")


# import cowsay
# import sys

# if len(sys.argv)==2:
#     cowsay.cow("hello"+sys.argv[1])


# import requests
# import sys

# if len(sys.argv)!=2:
#     sys.exit()



## Unit tests
# def main():
#     x = int(input("What's x?"))
#     print("x squared is",square(x))


# def square(x):
#     return x*x


# def main():
#     name=input("What's your name?")
#     hello(name)

# def hello(to="world"):
#     print("hello",to)


# # for i in ["Hermione","Ron"]:
# #     hello(i)
# if __name__=="__main__":    
#     main()



# name = input("Enter your name?")
# match name:
#     case "Harry"|"Ron"|"Harry":
#         print("Gryffindor")
#     case "Draco":
#         print("Slytherin")
#     case _:
#         print("Who?")


# l = ["Prince","Francis"]
# print(sorted(l))
# print(l)


# name = input("What's your name?")
# with open("names.txt","a") as f:
#     f.write(name)

# with open("names.txt") as file:
#     lines = file.readlines()
# for line in lines:
#     print(f"hello,{line.rstrip()}")


# for line in lines:
#     print(line,end='')


# names= []

# with open("names.txt","r") as file:
#     for line in file:
#         names.append(line.rstrip())
    
# print(sorted(names))
# print(names)

# names= []

# with open("names.txt","r") as file:
#     for line in file:
#         names.append(line.rstrip())

# print(sorted(names,reverse=True))


# with open('students.csv','r') as file:
#     for line in file:
#         row = line.split(",")
#         print(f"{row[0]} is from {row[1].rstrip()}")


# with open('students.csv','r') as file:
#     for line in file:
#         name,house = line.rstrip().split(',')
#         print(f"{name} is from {house}")


# s = "  Prince,Francis   "
# print(s.strip())

# students = []

# with open("students.csv","r") as file:
#     for line in file:
#         student = {}
#         name,house = line.strip().split(',')
#         student['name'] = name
#         student['house'] = house
#         students.append(student)
# print(students)

# for student in students:
#     print(f"{student['name']} is from {student['house']}")

# def get_name(student):
#     return student['name']

# for student in sorted(students,key=get_name,reverse=True):
#     print(f"{student['name']} is from {student['house']}")


# for student in sorted(students,key=lambda student:student['name']):
#     print(f"{student['name']} is from {student['house']}")


# import re
# email = input("What's your email?")

# if re.search(r"^\w+(\.)?\w+@(\w+\.)?\w+\.edu$",email,flags=re.IGNORECASE):
#     print("valid")
# else:
#     print("invalid")


# name = input("Enter your name:")
# if "," in name:
#     last,first = name.split(',')
#     name = f"{first} {last}"
# print(f"hello, {name}")

# import re
# name = input("Enter your name:")

# if matches:= re.search(r"^(.+),\s?(.+)$",name):
#     name = matches.group(2)+ " "+matches.group(1)
# print(f"hello, {name}")


# import re
# url = input("URL: ").strip()
# matches= re.search(r"^https?://(www\.)?twitter\.com/(.+)$",url,re.IGNORECASE)

# if matches:
#     print(f"Username: {matches.group(2)}")

# username = re.sub(r"https://twitter.com/","",url)
# username = url.replace("https://twitter.com/","")
# print(f"Username: {username}")

# matches = re.search(r"^(.+),\s?(.+)$",name)



# if matches:
#     last = matches.group(1)
#     firs = matches.group(2)
#     name = matches.group(2)+" "+matches.group(1)
# print(f"hello, {name}")

# if matches:
#     last = matches.group(1)
#     first = matches.group(2)
#     name = f"{first} {last}"
# print(f"hello, {name}")
# if matches:
#     last,first = matches.groups()
#     name= f"{first} {last}"

# print(f"hello, {name}")



# class Student:
#     def __init__(self,name,house,patronous="Stag"):
#         if not name:
#             raise ValueError("Missing Name")
#         # if house not in ["Gryffindor","Hufflepuff","Ravenclaw","Slytherin"]:
#         #     raise ValueError("Invalid house")
#         self.name = name
#         self._house = house
#         self.patronous = patronous
        
#     def __str__(self) -> str:
#         return f"{self.name} is from {self.house}"
    

#     def charm(self):
#         match self.patronous:
#             case "Stag":
#                 return "🦌"
#             case "Otter":
#                 return "🦦"
#             case "Jack Russel Terrier":
#                 return "🐶"
#             case _:
#                 return "✨"
            
#     @property
#     def house(self):
#         print("Into the getter")
#         return self._house
    
#     @house.setter
#     def house(self,value):
#         if value not in ["Slytherin","Hufflepuff"]:
#             raise ValueError("Invalid house")
#         print("Into the setter")
#         self._house = value
#         return self._house
    
#     @classmethod
#     def get(cls):
#         name = input("Name:")
#         house = input("House:")
#         return cls(name,house)
    
# def main():
#     # student = get_student()
#     # print("Expecto Patronum!!")
#     # student.house = "Slytherin"
#     student= Student.get()
#     print(student.name)
#     print(student.house)

# def get_student():
#     name = input("Name: ")
#     house = input("House: ")
#     patronous = input("Patronous: ")
#     return Student(name,house,patronous)


# if __name__=="__main__":
#     main()


# import random
# class Hat:
#     houses = ["Gryffindor","Hufflepuff","Ravenclaw","Slytherin"]
#     def __init__(self):
#         self.houses = ["Gryffindor","Hufflepuff","Ravenclaw","Slytherin"]
    
#     @classmethod
#     def sort(cls,name):
#         print(name,"is in",random.choice(cls.houses))


# # hat= Hat()
# Hat.sort("Harry")

# class Wizard:
#     def __init__(self,name):
#         if not name:
#             raise ValueError("Missing Name")
#         self.name = name


# class Student(Wizard):
#     def __init__(self,name,house):
#         super().__init__(name)
#         self.house = house


# class Professor:
#     def __init__(self,name,subject):
#         super().__init__(name)
#         self.subjet = subject


# wizard = Wizard("Albus")
# student = Student("Harry","Gryffindor")
# professor = Professor("Severus","Defence against the dark arts")


# class Wizard:
#     def __init__(self,name) -> None:
#         self.name = name

# class Student(Wizard):
#     def __init__(self, name,house) -> None:
#         super().__init__(name)
#         self.house = house

# class Professor(Wizard):
#     def __init__(self, name,subject) -> None:
#         super().__init__(name)
#         self.subject = subject

# wizard = Wizard("Albus")
# student = Student("Harry","Gryffindor")
# professor = Professor("Severus","Defence against the dark arts")

# print(professor.name)
# print(professor.subject)


# class Vault:
#     def __init__(self,galleons =0,sickles=0,knuts=0):
#         self.galleons=galleons
#         self.sickles =sickles
#         self.knuts = knuts

#     def __str__(self) -> str:
#         return f"{self.galleons} Galleons, {self.sickles} Sickles,{self.knuts} Knuts"
    
#     def __add__(self,other):
#         galleons = self.galleons + other.galleons
#         sickles = self.sickles+ other.sickles
#         knuts = self.knuts + other.knuts
#         return Vault(galleons,sickles,knuts)

# potter = Vault(100,50,25)
# print(potter)

# weasley = Vault(25,50,100)
# print(weasley)


# total = potter + weasley
# print(total)


# def total(galleons,sickles,knuts):
#     return (galleons*17+sickles)*29+knuts

# coins = {"galleons":100,"sickles":50,"knuts":25}

# print(total(**coins),"Knuts")


# def f(*args,**kwargs):
#     print("Positional:",args)
#     print("Named:",kwargs)

# f(100,50,25,89,galleons=26,knuts = 50)



# def f(*args,**kwargs):
#     print("Positional:",args)
#     print("Named:",kwargs)


# f(100,25,8,78,64,galleons = 25,knuts = 79)


# x = [i*i for i in [1,2,3,4]]
# print(x)

# x = (i*i for i in [1,2,3,4])
# print(list(x))


# import csv
# csv_gen = csv.reader('prince')
# print(list(csv_gen))
