# first, _=input("What's your name? ").split(" ")
# print(f"hello, {first}")


# def total(galleons,sickles,knuts):
#     return (galleons*17 + sickles)*29 +knuts


# coins = [100,50,25]

# # print(total(coins[0],coins[1],coins[2]),"Knuts")
# print(total(*coins),"Knuts")

# coins = {"galleons":100,"sickles":50,"knuts":25}

# print(total(**coins),"Knuts")


def f(*args,**kwargs):
    print("Named:", kwargs)



f(galleons =100, sickels=50,knuts=25)
