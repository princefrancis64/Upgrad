import random

# class Hat:
#     def __init__(self):
#         self.houses = ["Gryffindor","Hufflepuff","Ravenclaw","Slytherin"]

#     def sort(self,name):
#         print(name,"is in ",random.choice(self.houses))


# hat = Hat()
# hat.sort("Harry")


## Class Method

# class Hat:
#     houses = ["Gryffindor","Hufflepuff","Ravenclaw","Slytherin"]

#     @classmethod
#     def sort(cls,name):
#         print(name,"is in ",random.choice(cls.houses))

# Hat.sort("Harry")


class Student:
    def __init__(self,name,house):
        self.name = name
        self.house = house

    def __str__(self) -> str:
        return f"{self.name} is in {self.house}"
    

    @classmethod
    def get(cls):
        name = input("Name: ")
        house = input("House: ")
        return cls(name,house)
    

def main():
    student = Student.get()
    print(student)

if __name__=="__main__":
    main()
