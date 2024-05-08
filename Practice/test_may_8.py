# from may_8 import square
# import pytest
# from may_8 import square
# import pytest

# def main():
#     test_positive()
#     test_negative()
#     test_zero()


# def test_positive():
#     assert square(2)==4
#     assert square(3)==9

# def test_negative():
#     assert square(-2)==4
#     assert square(-3)==9

# def test_zero():
#     assert square(0)==0


# def test_str():
#     with pytest.raises(TypeError):
#         square("cat")

# def test_square():
#     assert square(2)==4
#     assert square(3)==9
#     assert square(-2)==4
#     assert square(-3)==9
#     assert square(0)==0



# def test_square():
    # try:
    #     assert square(2)==4
    # except AssertionError:
    #     print("2 squared was not 4")
    # try:
    #     assert square(3)==9
    # except AssertionError:
    #     print('3 squared is not 9')
    # try:
    #     assert square(4)==16
    # except AssertionError:
    #     print("4 squared was not 16")
    # try:
    #     assert square(0)==0
    # except AssertionError:
    #     print("0 squared is not 0")
# def test_square():
#     if square(2)!=4:
#         print('2 squared was not 4')
#     if square(3)!=9:
#         print('3 squared was not 9')
#     if square(4)!=16:
#         print('4 squared was not 16')
#     else:
#         print("TEST CASE PASSED")
# 
# 

# def main():
#     test_positive()
#     test_negative()
#     test_zero()
#     test_str()

# def test_positive():
#     assert square(2)==4
#     assert square(3)==9

# def test_negative():
#     assert square(-2)==4
#     assert square(-3)==9

# def test_zero():
#     assert square(0)==0

# def test_str():
#     with pytest.raises(TypeError):
#         square("prince")



# def main():
#     name=input("What's your name?")
#     hello(name)

# def hello(to="world"):
#     print("hello",to)


from may_8 import hello


def main():
    test_default()
    # test_argument()
    

def test_default():
    hello()=="hello, world"

def test_argument():
    for name in ['Hermione',"Ron","Harry"]:
        hello(name)==f"hello, {name}"
        
# def test_argument():
#     hello("David")=="hello, David"

if __name__=="__main__":
    main()

