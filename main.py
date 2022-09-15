from fastapi import FastAPI
from auth import auth

app = FastAPI()

@app.get("/")
def home():
    return "Hello"

app.include_router(auth)