import rpy2.robjects as ro
from rpy2.robjects import pandas2ri
from flask import Flask, request
from flask_cors import CORS

# Required to communicate between R / Python data structures
pandas2ri.activate()

# Configure R and access required functions
r = ro.r
r.source("custom_function.R")
r_custom_function = ro.globalenv["custom_function"]

# Create the Flask application
app = Flask(__name__)
CORS(app)

@app.post("/task")
def generate_partner():
    # Example: Expect two numbers, a and b, and return a string describing how to add them
    data = request.get_json()
    a = float(data["a"])
    b = float(data["b"])

    # Take the values and pass them to the R function
    output = r_custom_function(a, b)[0]

    # Format and return the value of adding the two numbers
    return "{} + {} = {}".format(a, b, output)

if __name__ == "__main__":
    app.run(host="localhost", port=8000, debug=True)
