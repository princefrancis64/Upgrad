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
if re.search(r".+@.+\.edu",email):
    print("Valid")
else:
    print("Invalid")
