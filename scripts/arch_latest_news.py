import requests
import datetime
from bs4 import BeautifulSoup

url = "https://www.archlinux.org"
req = requests.get(url)
req_html = req.text

soup = BeautifulSoup(req_html, "html.parser")

# div#news > h3 + a + (h4 > a) + p + div.article-content
news = soup.find("div", id="news")
topics = news("h4", limit=3, recursive=True)

# .text returns unicode type, .string returns NavigableString
titles = [t.find("a").text for t in topics]
links = [url + l.find("a")["href"] for l in topics]
timestamps = [p.find_next_sibling("p").text for p in topics]

print("┌────────────┬─────────────┐")
print("│ Arch Linux │ Latest News │")
print("└────────────┴─────────────┘\n")

for i, topic in enumerate(titles):
    print(f"\033[33m[{datetime.datetime.strptime(timestamps[i], '%Y-%m-%d').strftime('%A, %d %B %Y')}]\033[0m")
    print(topic)
    print(f"\033[36m{links[i]}\033[0m\n")
