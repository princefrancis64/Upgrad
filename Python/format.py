import re

name = input("What's your name? ").rstrip()
# () is used to capture something
matches = re.search(r"^(.+), *(.+)$",name) 

# if matches:
#     last,first = matches.groups()
#     name = f"{first} {last}"
# print(f"hello, {name}")

# if "," in name:
#     last,first = name.split(", ")
#     name = f"{first} {last}"
# print(f"hello, {name}")

# if matches:
#     last = matches.group(1)
#     first = matches.group(2)
#     name = f"{first} {last}"

if matches:
    name = matches.group(2) + " " + matches.group(1)

print(f"hello, {name}")