# url = input("URL:").strip()

# username = url.replace("https://twitter.com/","")
# username = url.removeprefix("https://twitter.com/")
# print(f"Username: {username}")


# import re
# url = input("URL:").strip()

# # username = re.sub(r"https://twitter.com/","",url)
# username = re.sub(r"(\w).*(https?://)?(www\.)?twitter\.com/","",url)


import re
url = input("Url:").strip()
# matches = re.search(r"^https?://(www\.)?twitter\.com/(.+)$",url,re.IGNORECASE)

if matches:= re.search(r"^http(?:s)?://(?:www\.)?twitter\.com/([\w]+)",url,re.IGNORECASE):
    print(f"Username: {matches.group(1)}")

