# server.py
"""Import logging module to create logs on the messages with timestamp."""
import logging  # Import the logging module
from concurrent import futures
import grpc
import communication_pb2
import communication_pb2_grpc

class CommunicationServicer(communication_pb2_grpc.CommunicationServicer):
    """"This is the CommunicationServicer class used by the grcp module."""
    def SendMessage(self, request, context):
        """This function ACKNOWLED the request from the client app"""
        logging.info("Received message: %s", request.name)  # Log the received message
        return communication_pb2.HelloReply(message=f"Hello, {request.name}!")

def run():
    """Function that run the grcp server receives the messages from the client app"""
    logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
    server = grpc.server(futures.ThreadPoolExecutor(max_workers=10))
    communication_pb2_grpc.add_CommunicationServicer_to_server(CommunicationServicer(), server)
    server.add_insecure_port('[::]:50051')
    server.start()
    server.wait_for_termination()

if __name__ == '__main__':
    run()
