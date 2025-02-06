import wikipedia
from textblob import TextBlob


def wiki(name="War Goddess", length=1):
    """Wiki Fetcher"""

    my_wiki = wikipedia.summary(name, length)
    return my_wiki


def search_wiki(name):
    """Search Wiki for Names"""

    results = wikipedia.search(name)
    return results


def phrase(name):
    """Returns phrases from wiki name"""
    page = wiki(name)
    blob = TextBlob(page)
    return blob.noun_phrases
