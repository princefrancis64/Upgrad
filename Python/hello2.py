# print("hello,world")

# try:
#     x = int(input("What's x ?"))
#     print(f"x is {x}")
# except ValueError:
#     print("x is not an integer")



# try:
#     x = int(input("What's x ?"))
# except ValueError:
#     print("x is not an integer")

# ### if there is not exception then this is going to be executed
# else:
#     print("Else statement is executed")
#     print(f"x is {x}")


# while True:
#     try:
#         x = int(input("What's x ?"))
#     except ValueError:
#         print("x is not an integer")
#     else:
#         break

# print(f"x is {x}")


def main():
    x = get_int()
    print(f"x is {x}")

# def get_int():
#     while True:
#         try:
#             x = int(input("What's x ?"))
#         except ValueError:
#             print("x is not an integer")
#         else:
#             break
#     return x


# def get_int():
#     while True:
#         try:
#             return int(input("What's x ?"))
#         except ValueError:
#             print("x is not an integer")

def get_int():
    while True:
        try:
            return int(input("What's x ?"))
        except ValueError:
            pass

main()