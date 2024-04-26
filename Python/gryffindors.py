# students = [
#     {"name":"Hermione","house":"Gryffindor"},
#     {"name":"Harry","house":"Gryffindor"},
#     {"name":"Ron","house":"Gryffindor"},
#     {"name":"Draco","house":"Slytherin"}
# ]

# gryffindors = [
#     student['name'] for student in students if student['house']=="Gryffindor"
# ]

# for gryffindor in sorted(gryffindors):
#     print(gryffindor)


# def is_gryffindor(s):
#     return s['house'] =='Gryffindor'


# gryffindors = filter(is_gryffindor,students)

# for gryffindor in gryffindors:
#     print(gryffindor['name'])

# for gryffindor in sorted(gryffindors,key = lambda s:s['name']):
#     print(gryffindor['name'])

# is_prime =True

# number = int(input("Enter a number: "))
# for i in range(2,number):
#     if number%i==0:
#         is_prime=False
#         break

# if is_prime:
#     print(f"{number} is a prime number")
# else:
#     print(f"{number} is not a prime number")
    


students = ['Hermione','Harry','Ron']

gryffindors = []

# for student in students:
#     gryffindors.append({"name":student,"house":"Gryffindor"})


# print(gryffindors)

# gryffindors = [{"name":student,"house":"Gryffindor"} for student in students]
# gryffindors = {student:"Gryffindor" for student in students}

# print(gryffindors)


for idx,item in enumerate(students):
    print(idx+1,item)