# i = 1
# # while i!= 0:
# #     print("meow")
# #     i = i-1

# while i<=3:
#     print("meow")
#     # i = i+1
#     i += 1

# while True:
#     n = int(input("What's n? "))
#     if n>0:
#         break
#     else:
#         continue


# for _ in range(n):
#     print("meow")



# for i in range(5):
#     x = i


# print(x)


def main():
    number = get_number()
    meow(number)

def get_number():
    while True:
        n = int(input("What's n? "))
        if n>0:
            return n
            break
        else:
            continue

def meow(n):
    for _ in range(n):
        print("meow")



main()