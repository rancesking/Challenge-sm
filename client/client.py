# client.py
"""Import os module to get acceess to the enviroment variables."""
import os
import datetime
from flask import Flask, render_template
from flask_cors import CORS  # Import CORS
import grpc
import communication_pb2
import communication_pb2_grpc

app = Flask(__name__, static_url_path='/static', static_folder='static')
CORS(app, origins='*')

@app.route('/')
def index():
    """Function return the index.html file"""
    return render_template('index.html')

@app.route('/send_message')
def send_message():
    """Function establish a grpc channel between client and server python app's"""
    # Retrieve the server IP from the environment variable
    server_ip = os.environ.get("endpoint", "127.0.0.1")
    server_port = "50051"

    # Use the retrieved IP to create the gRPC channel
    channel = grpc.insecure_channel(f'{server_ip}:{server_port}')

    # Create the gRPC stub
    stub = communication_pb2_grpc.CommunicationStub(channel)

    # Get the current timestamp
    timestamp = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')

    # Added a list to queue the messages
    messages = []

    for i in range(10):  # Adjust the number of messages as needed
        response = stub.SendMessage(communication_pb2.HelloRequest(name=f"Msg {i} from web client"))
        # Print or log the message with timestamp
        message_with_timestamp = f"{timestamp} - Response received: {response.message}"
        message = message_with_timestamp
        print(message)
        messages.append(message)

    # Return the messages as plain text response
    return '\n'.join(messages)

@app.route('/clear_logs')
def clear_logs():
    """Function clear the messages box on the index.html file"""
    return "Logs cleared successfully"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
