from fastapi import APIRouter, Header, Body
from schemas import User, UserLogIn, curs ,conn
from functions import getToken, hashPassword, verifyPassword

auth = APIRouter()

@auth.post("/diet_app/auth/createAccount")
def signUp(userData : User = Body(...)):
    try:
        curs.execute("""
        INSERT INTO Users(username, email, password, gender, phone_number, height, weight, age, body_type)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)
        """, (userData.name, userData.email, hashPassword(userData.password.strip()), userData.gender, userData.phone, userData.height, userData.weight, userData.age, userData.body.name))
        conn.commit()
        token = getToken({"email":userData.email,"password": hashPassword(userData.password.strip())})
        return {"token":token}
    except Exception as e:
        print(e)
        return {"failure": e} 

@auth.post("/diet_app/auth/logIn")
def logIn(userData: UserLogIn = Body(...)):
    curs.execute("""
        SELECT * FROM users WHERE email=%s 
    """, (userData.email, ))
    user = curs.fetchone()
    if user == None:
        return {"failure": "Email dosen't exists"}
    elif verifyPassword(userData.password, user["password"]):
        return {"token": getToken({"email": userData.email, "password":hashPassword(userData.password.strip())})}
    else:
        return {"failure": "Wrong password"}