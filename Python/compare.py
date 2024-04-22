# x =  int(input("What's x? "))
# y =  int(input("What's y? "))

# # if x<y:
# #     print("x is less than y")
# # elif x>y:
# #     print("x is greater than y")
# # else:
# #     print("x is equal to y")


# if x<y or x>y:
#     print("X is not equal to y")
# else:
#     print("x is equal to y")


def main():
    x = int(input("What's x? "))
    if is_even(x):
        print("Even")
    else:
        print("Odd")

# def is_even(n):
#     if n%2==0:
#         return True
#     else:
#         return False

# def is_even(n):
#     return True if n%2==0 else False

def is_even(n):
    return (n%2==0)

main()
