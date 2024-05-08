class CustomizedInteger:
    def __init__(self,integer):
        self.integer = integer

    def __str__(self) -> str:
        if self.integer==4:
            return 'Four'
    
    def __repr__(self) -> str:
        return f"CustomizedInteger({self.integer})"

int1 = CustomizedInteger(4)
print(str(int1))
# print(int1.integer)