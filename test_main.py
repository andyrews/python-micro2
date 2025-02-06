from fastapi.testclient import TestClient
from main import app

client = TestClient(app)


def test_read_main():
    res = client.get("/")
    assert res.status_code == 200
    assert res.json() == {"message": "Wikipedia API. Call /search or /wiki"}


def test_read_phrase():
    res = client.get("/phrase/tite")
    assert res.status_code == 200
    assert res.json() == {
        "results": [
            "titi monkeys",
            "new world monkeys",
            "callicebinae",
            "extant genera",
            "cheracebus",
            "callicebus",
            "plecturocebus",
        ]
    }
