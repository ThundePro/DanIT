from flask import Flask
import socket

app = Flask(__name__)

@app.route('/')
def get_hostname():
    hostname = socket.gethostname()
    return f"Hostname/Pod: {hostname}"

@app.route('/readiness')
def readiness():
    # Logic to determine if the app is ready to handle requests
    # For simplicity, we just return a success message.
    return "Ready", 200

@app.route('/liveness')
def liveness():
    # Logic to determine if the app is alive
    # For simplicity, we just return a success message.
    return "Alive", 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
