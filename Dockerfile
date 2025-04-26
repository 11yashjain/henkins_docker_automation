# Use the Python 3.8 base image
FROM python:3.8

# Set working directory inside container
WORKDIR /app

# Copy local files to container
COPY . /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port (Flask app runs on 5000)
EXPOSE 5000

# Command to run the application
CMD ["python", "app.py"]
