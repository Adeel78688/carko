# Use an official Python runtime as a parent image
FROM python:3.11-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Install system dependencies for OpenCV, PyAutoGUI, and PostgreSQL
RUN apt-get update && apt-get install -y \
    libpq-dev \
    gcc \
    libgl1-mesa-glx \
    libglib2.0-0 \
    python3-tk \
    python3-dev \
    xvfb \
    xobj \
    && apt-get clean

# Set the working directory in the container
WORKDIR /app

# Install Python dependencies
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your application code
COPY . /app/

# Expose the port Django runs on
EXPOSE 8000

# Command to run the application
# Note: xvfb-run allows PyAutoGUI to run without a physical monitor
CMD ["xvfb-run", "python", "manage.py", "runserver", "0.0.0.0:8000"]