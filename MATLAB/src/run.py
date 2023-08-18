from flask import Flask, request
from flask_cors import CORS
import matlab.engine

# Create the Flask application
app = Flask(__name__)
CORS(app)

# Configure MATLAB
eng = matlab.engine.start_matlab()
eng.cd(r"./", nargout=0)

# Route to receive input from the participant
@app.post("/task")
def handle_request():
    # Example: Expect two numbers, a and b, and return a string describing how to add them
    data = request.get_json()
    a = float(data["a"])
    b = float(data["b"])

    # Take the values and pass them to the MATLAB function
    output = eng.custom_function(a, b, nargout=1)

    # Format and return the value of adding the two numbers
    return "{} + {} = {}".format(a, b, output)

if __name__ == "__main__":
    app.run(port=8000, debug=True)
