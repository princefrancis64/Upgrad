email = input("What's your email? ").strip()

# if "@" in email:
#     print("Valid")
# else:
#     print("Invalid")



# if "@" in email and "." in email:
#     print("Valid")
# else:
#     print("Invalid")

# username, domain = email.split("@")
# if username and "." in domain:
#     print("Valid")
# if username and domain.endswith(".edu"):
#     print("Valid")
# else:
#     print("Invalid")

import re

# if re.search("@",email):
#     print("Valid")
# else:
#     print("Valid")


# if re.search(".*@.*",email):
#     print("Valid")
# if re.search("..*@..*",email):
#     print("Valid")
# if re.search(r".+@.+\.edu",email):
#     print("Valid")
# if re.search(r"^.+@.+\.edu$",email):
#     print("Valid")
# if re.search(r"^[^@]+@[^@]+\.edu$",email):
#     print("Valid")
# if re.search(r"^[a-zA-Z0-9_]+@[a-zA-Z0-9_]+\.edu$",email):
#     print("Valid")
# if re.search(r"^\w+@\w+\.edu$",email):
#     print("Valid")
# if re.search(r"^[\w.]+@\w+\.(edu|com|gov|net)$",email):
#     print("Valid")
# if re.search(r"^[\w.]+@\w+\.(edu|com|gov|net)$",email,flags=re.IGNORECASE):
#     print("Valid")
# if re.search(r"^[\w.]+@(\w+\.)?\w+\.edu$",email,flags=re.IGNORECASE):
#     print("Valid")
if re.search(r"^(\w|\.)+@(\w+\.)?\w+\.(edu|com)$",email,flags=re.IGNORECASE):
    print("Valid")
else:
    print("Invalid")
