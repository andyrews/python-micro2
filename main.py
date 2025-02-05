from mylib.logic import wiki, search_wiki
from fastapi import FastAPI

import uvicorn

app = FastAPI()

@app.get("/")
async def root():
    return {"message": "Wikipedia API. Call /search or /wiki"}

@app.get("/search/{val}")
async def search(val: str):
    """Page to search in wiki"""
    res = search_wiki(val)
    return {"results": res}

@app.get("/wiki/{name}")
async def wiki_search(name: str):
    """Get page of wiki"""
    res = wiki(name)
    return {"results": res}

if __name__ == "__main__":
    uvicorn.run(app, port=8080, host="0.0.0.0")

