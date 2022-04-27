# Imports
import os

# Flask
from flask import Flask, request

# Example function
from function import example_function

# Define constants
ENDPOINT = "/task/intentions" # URL path
PORT = 8000 # Port for server operation
DATA_PATH = "data" # Directory for storing generated data

# Configure Flask
app = Flask(__name__)

def setup():
  # Setup the environment for running the server
  try:
    os.makedirs(DATA_PATH)
  except OSError:
    pass

# Configure the app route
@app.route(ENDPOINT, methods=["GET"])
def handler():
  # Extract and check the data using the 'request' variable
  a = request.args['a']
  b = request.args['b']

  if a is None or b is None:
    # If either data element is invalid, return a 400 error
    return None

  # Modify or fix data if required for computation
  a = int(a)
  b = int(b)

  # Perform computation using data
  result = example_function(a, b)

  # Generate the response to the cognitive task, casting to string
  return str({
    "num": result,
  })

# Run the setup function
setup()

# Start the Flask application
app.run(host="0.0.0.0", port=PORT)
