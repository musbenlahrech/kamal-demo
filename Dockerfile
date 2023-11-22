# Use the official Python Alpine image as a base image
FROM python:3.10-alpine

# Set the working directory in the container
WORKDIR /app

# Install any dependencies
RUN apk add --no-cache curl

RUN apk add --no-cache gcc musl-dev linux-headers

# Copy the dependencies file to the working directory
COPY requirements.txt .

# Install any dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the content of the local src directory to the working directory
COPY main.py .

# Expose port 8000
EXPOSE 8000

# Command to run the application
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]