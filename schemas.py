from enum import Enum
from pydantic import BaseModel
import psycopg2
from psycopg2.extras import RealDictCursor


try:
    conn = psycopg2.connect(database="postgres", host="localhost", user="postgres", cursor_factory=RealDictCursor, password="saif@2002")
    curs = conn.cursor()
    print("CONNECTED")
except:
    print("Can't connect")

class BodyType(Enum):
    SKINNY : str = "Skinny"
    FIT: str = "Fit"
    BULKY: str = "Bulky"
    FAT: str = "Fat"

class User(BaseModel):
    name: str
    email: str
    password: str
    gender : str
    age: int
    phone :str
    height: float
    weight :float
    body: BodyType

class UserLogIn(BaseModel):
    email:str
    password: str
