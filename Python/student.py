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


def main():
    student = get_student()
    if student['name']=="Padma":
        student['house'] = "Ravenclaw"
    print(f"{student['name']} is from {student['house']}")

# def get_student():
#     student = {}
#     student["name"] = input("Name: ")
#     student["house"] = input("House: ")
#     return student


def get_student():
    name = input("Name: ")
    house = input("House: ")
    return {"name":name,"house":house}

if __name__=="__main__":
    main()
