# Use official Python image
FROM python:3.10-slim

# Set working directory inside container
WORKDIR /app

# Copy everything into /app
COPY . .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Set PYTHONPATH to make 'app' importable
ENV PYTHONPATH="/code"

# Expose port (if needed by Render)
EXPOSE 8000

# Run app
ENTRYPOINT  ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
