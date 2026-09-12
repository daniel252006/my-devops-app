# app.py
from flask import Flask, jsonify
import os

app = Flask(__name__)

# Read the version from the environment, default to "1.0 (Stable)"
VERSION = os.environ.get('APP_VERSION', '1.0 (Stable)')
COLOR = os.environ.get('APP_COLOR', 'green') # Used for visual testing

@app.route('/')
def home():
    # A simple webpage showing which version answered the request
    html = f"""
    <html>
    <body style="background-color: {COLOR}; color: white; font-family: Arial; text-align: center; padding: 50px;">
        <h1>🚀 DevOps Deployment Project</h1>
        <h2>Currently routing to: Version {VERSION}</h2>
    </body>
    </html>
    """
    return html

@app.route('/health')
def health():
    # Your bash scripts will hit this URL to see if the app is healthy!
    return jsonify(status="UP", version=VERSION), 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)