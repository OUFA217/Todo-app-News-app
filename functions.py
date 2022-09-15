from passlib.context import CryptContext
from jwt import encode, decode

from schemas import UserLogIn

context = CryptContext(schemes=["bcrypt"], deprecated="auto")

def hashPassword(password: str) -> str:
    return context.hash(password).strip()

def verifyPassword(password, hashedPassword) ->bool:
    return context.verify(password, hashedPassword)

def getToken(payload: dict[str, str]) -> str:
    token =  encode(payload={"name":payload["email"], "passWord":hashPassword(payload["password"].strip())}, key="dietApp2022", algorithm="HS256")
    return token

