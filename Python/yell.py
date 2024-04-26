# def main():
#     yell("This is CS50")


# def yell(phrase):
#     print(phrase.upper())


# def main():
#     yell(["This","is","CS50"])


# # def yell(words):
# #     for word in words:
# #         print(word,end='')

# def yell(words):
#     uppercased=[]
#     for word in words:
#         uppercased.append(word.upper())
#     print(*uppercased)


# def main():
#     yell("This","is","CS50")


# def yell(*words):
#     uppercased = []
#     for word in words:
#         uppercased.append(word.upper())
#     print(*uppercased)


def main():
    yell("This","is","CS50")


# def yell(*words):
#     uppercased = map(str.upper,words)
#     print(*uppercased)

def yell(*words):
    uppercased = [word.upper() for word in words]
    print(*uppercased)


if __name__=="__main__":
    main()