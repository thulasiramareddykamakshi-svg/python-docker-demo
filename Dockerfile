FROM python:3.12-slim

# Prevent Python from creating .pyc files
ENV PYTHONDONTWRITEBYTECODE=1

# Send Python output directly to container logs
ENV PYTHONUNBUFFERED=1

# Application directory
WORKDIR /app

# Install dependencies first for Docker layer caching
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Create a non-root user
RUN useradd --create-home --shell /bin/bash appuser \
    && chown -R appuser:appuser /app

# Run container as non-root user
USER appuser

# Document application port
EXPOSE 5000

# Start application
CMD ["python", "app.py"]
