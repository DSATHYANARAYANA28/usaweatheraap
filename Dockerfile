# Use a slim Python base image for efficiency
FROM python:3.10-slim

# Set a working directory for clarity
WORKDIR /app

# Copy requirements.txt for dependency management
COPY requirements.txt .

# Install dependencies using pip
RUN pip install -r requirements.txt

# Copy all application files and directories (excluding requirements.txt)
COPY . .

# Expose the port where the application will listen
EXPOSE 8000

# Use waitress server for efficient handling of concurrent requests
CMD ["python", "-m", "waitress", "--listen=0.0.0.0:8000", "server:app"]