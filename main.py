from fastapi import FastAPI, Depends
from sqlalchemy.orm import Session
from sqlalchemy import text

from database import get_db

app = FastAPI()

@app.get("/")
def read_root():
    return {"message": "Simplicity is key."}

@app.get("/db-test")
def test_db(db: Session = Depends(get_db)):
    try:
        db.execute(text("SELECT 1"))
        return {"status": "Connected!"}
    except Exception as e:
        return {"error": str(e)}