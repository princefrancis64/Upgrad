name = input("What's your name? ")

# if name=="Harry":
#     print("Gryffindor")
# elif name=="Hermione":
#     print("Griffindor")
# elif name =="Ron":
#     print("Griffindor")
# elif name=="Draco":
#     print("Slytherin")
# else:
#     print("Who?")

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
#     case "Harry" | "Hermione" | "Ron":
#         print("Gryffindor")
#     case "Draco":
#         print("Slytherin")
#     case _:
#         print("Who?")


match name:
    case "Harry" | "Hermione" | "Ron":
        print("Gryffindor")
    case "Draco":
        print("Slytherin")
    case _:
        print("Who?")