# x = 1
# y = 2
# z = x+y
# print(z)

# x = input("What's x? ")
# y = input("What's y? ")

# z = int(x)+int(y)
# print(z)

# x = int(input("What's x?  "))
# y = int(input("What's your y? "))

# print(x+y)

# print(int(input("What's x?  ")) + int(input("What's your y? ")))


# x = float(input("What's x?  "))
# y = float(input("What's your y? "))

# # z = round(x+y)
# # print(f"{z:,}")
# # print(x+y)
# z = x/y
# # print(round(z,3))
# print(f"{z:.2f}")           


def main():
    x = int(input("What's x? "))
    print("x squared is",square(x))

def square(x):
    return x*x

if __name__=="__main__":
    main()

