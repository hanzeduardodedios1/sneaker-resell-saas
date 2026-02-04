# 1. Start with a Python base image
FROM python:3.11-slim

# 2. Set the working directory inside the container
WORKDIR /app

# 3. Copy your requirements list into the container
COPY requirements.txt .

# 4. Install your Python libraries
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copy all your project files into the container
COPY . .

# 6. The command to start your app
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]