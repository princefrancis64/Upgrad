# with open("names.csv") as file:
#     for line in file:
#         # print(line.rstrip().split(","))
#         # print(line.rstrip())
#         row = line.rstrip().split(",")
#         print(f"{row[0]} is in {row[1]}")


# import pandas as pd
# print(pd.read_csv("names.csv",header=None))

# students = []

# with open("names.csv") as file:
#     for line in file:
#         name, house = line.rstrip().split(",")
#         print(f"{name} is in {house}")

# with open("names.csv") as file:
#     for line in file:
#         name, house  = line.rstrip().split(",")
#         students.append(f"{name} is in {house}")

# for student in sorted(students):
#     print(student)

# with open("names.csv") as file:
#     for line in file:
#         name,house = line.rstrip().split(",")
#         student={}
#         student["name"] = name
#         student["house"] = house
#         students.append(student)

# def get_name(student):
#     return student['name']

# def get_house(student):
#     return student["house"]

# for student in sorted(students,key=get_name,reverse=True):
#     print(f"{student['name']} is in {student['house']}")

# for student in sorted(students,key=get_house,reverse=False):
#     print(f"{student['name']} is in {student['house']}")

# print(students)

# for student in students:
#     print(f"{student["name"]} is in {student["house"]}")

# for student in students:
#     print(f"{student['name']} is in {student['house']}")

# d = {"Priya":"hastsal","Prince":"Rajouri"}
# for i in sorted(d):
#     print(i,d[i])


# for student in sorted(students,key=lambda student:student["name"],reverse=False):
#     print(f"{student['name']} is in {student['house']}")



# x = lambda n:n**2
# print(x(2))


# students = []
# with open("names.csv") as file:
#     for line in file:
#         name, home  = line.rstrip().split(",")
#         student = {"name":name,"home":home}
#         students.append(student)

# for student in sorted(students,key=lambda student:student['name']):
#     print(f"{student['name']} is from {student['home']}")


import csv
# students =[]

# with open("names.csv") as file:
#     reader = csv.reader(file)
#     for row in reader:
#         students.append({"name":row[0],"home":row[1]})

# with open("names.csv") as file:
#     reader = csv.reader(file)
#     for name,home in reader:
#         students.append({"name":name,"home":home})

# print(students)

########################
# import csv

# students = []

# with open("names.csv") as file:
#     reader = csv.DictReader(file)
#     for row in reader:
#         students.append({"name":row["name"],"home":row["home"]})

# for student in sorted(students,key=lambda student:student["name"]):
#     print(f"{student["name"]} is from {student['home']}")


###########################################################
# import csv

# name = input("What's your name? ")
# home = input("Where's your home? ")

# with open("students.csv","a") as file:
#     writer = csv.writer(file)
#     writer.writerow([name,home])

##########################################################
import csv
name = input("What's your name? ")
home = input("What's your home? ")

with open("students.csv","a") as file:
    writer = csv.DictWriter(file,fieldnames=["name","home"])
    writer.writerow({"name":name,"home":home})