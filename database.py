import os
from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker

# ---------------------------------------------------------
# NOTE: In Docker, you don't need 'load_dotenv' or path logic.
# Docker automatically injects variables from .env into the OS.
# ---------------------------------------------------------

# Grab credentials from .env
user = os.getenv("POSTGRES_USER", "postgres")
password = os.getenv("POSTGRES_PASSWORD", "password")
host = os.getenv("DB_HOST", "db")      # 'db' matches your docker-compose service name
port = os.getenv("DB_PORT", "5432")
db_name = os.getenv("POSTGRES_DB", "postgres")

# 2. Build the URL dynamically
DATABASE_URL = f"postgresql://{user}:{password}@{host}:{port}/{db_name}"

# 3. Create the engine
engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

Base = declarative_base()

# Dependency to get the DB session in your API routes
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()