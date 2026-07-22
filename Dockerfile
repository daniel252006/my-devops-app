# Use a lightweight version of Python
FROM python:3.9-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy just the requirements first (optimizes Docker caching)
COPY requirements.txt .

# Install the Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your application code
COPY . .

# Tell Docker this container listens on port 5000
EXPOSE 5000

# The command to start the app
CMD ["python", "app.py"]