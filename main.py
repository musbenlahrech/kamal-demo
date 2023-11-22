import os
from fastapi import FastAPI

app = FastAPI()


name = os.environ.get("USER_NAME", "world")


@app.get("/")
def read_root():
    return {"message": f"Hello, {name} FastAPI!"}


@app.get("/up")
def up():
    return {"ok": True}
