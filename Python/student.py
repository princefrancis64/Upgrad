# def main():
#     name = get_name()
#     house = get_house()
#     print(f"{name} from {house}")


# def get_name():
#     return input("Name: ")


# def get_house():
#     return input("House: ")


# def main():
#     # name,house = get_student()
#     # print(f"{name} is from {house}")
#     student = get_student()
#     if student[0]=="Padma":
#         student[1]="Ravenclaw"
#     print(f"{student[0]} is from {student[1]}")

# def get_student():
#     name = input("Name: ")
#     house = input("House: ")
#     return (name,house)   # this is returning 1 value which is a tuple

# def get_student():
#     name = input("Name: ")
#     house = input("House: ")
#     return [name,house]


# def main():
#     student = get_student()
#     if student['name']=="Padma":
#         student['house'] = "Ravenclaw"
#     print(f"{student['name']} is from {student['house']}")

# def get_student():
#     student = {}
#     student["name"] = input("Name: ")
#     student["house"] = input("House: ")
#     return student


# def get_student():
#     name = input("Name: ")
#     house = input("House: ")
#     return {"name":name,"house":house}

# class Student:
#     ...


# def main():
#     student = get_student()
#     print(f"{student.name} is from {student.house}")

# def get_student():
#     student = Student()
#     student.name = input("Name: ")
#     student.house = input("House: ")
#     return student


# class Student:
#     def __init__(self,name,house):
#         if not name:
#             raise ValueError("Missing name")
#         if house not in ["Gryffindor","Hufflepuff","Ravenclaw","Slytherin"]:
#             raise ValueError("Invalid house")
#         self.name = NameError
#         self.house = house


# def main():
#     student = get_student()
#     print(f"{student.name} is from {student.house}")

# def get_student():
#     name = input("Name: ")
#     house = input("House: ")
#     # student  = Student(name, house)
#     return Student(name, house)

#     # return student


# class Student:
#     ...


# def main():
#     student = get_student()
#     print(f"{student.name} is from {student.house}")

# def get_student():
#     student = Student()
#     student.name = input("Name: ")
#     student.house = input("House: ")
#     return student


# class Student:
#     def __init__(self,name,house,patronus):
#         if not name:
#             raise ValueError("Missing Name")
#         if house not in ["Gryffindor","Hufflepuff","Ravenclaw","Slytherin"]:
#             raise ValueError("Invalid house")
#         self.name = name
#         self.house = house
#         self.patronus = patronus

#     def __str__(self):
#         return f"{self.name} is from {self.house}"
    

#     def charm(self):
#         match self.patronus:
#             case "Stag":
#                 return "🐎"
#             case "Otter":
#                 return "🦦"
#             case "Jack Russell terrier":
#                 return "🐶"
#             case _:
#                 return "🧙"


# def main():
#     student = get_student()
#     # print(f"{student.name} is from {student.house}")
#     print("Expecto Patronum!")
#     print(student.charm())
    

# def get_student():
#     name  = input("Name: ")
#     house  = input("House: ")
#     patronus = input("Patronous: ")
#     # student = Student(name,house)
#     return Student(name,house,patronus)


# class Student:
#     def __init__(self,name,house):
#         self.name = name
#         self.house = house
    
#     def __str__(self):
#         return f"{self.name} is from {self.house}"
    

#     @property
#     def name(self):
#         return self._name
    
#     @name.setter
#     def name(self,name):
#         if not name:
#             raise ValueError("Missing Name")
#         self._name = name
    
#     #Getter
#     @property
#     def house(self):
#         return self._house
    
#     # Setter
#     @house.setter
#     def house(self,house):
#         if house not in ["Gryffindor","Hufflepuff","Ravenclaw","Slytherin"]:
#             raise ValueError("Invalid house")
#         self._house= house

# def main():
#     student = get_student()
#     # student.house = "Number Four,Private Drive"
#     student._house = "Number Four,Privet Drive"
#     print(student)

# def get_student():
#     name  = input("Name: ")
#     house  = input("House: ")
#     return Student(name,house)

# if __name__=="__main__":
#     main()



print(type(50))