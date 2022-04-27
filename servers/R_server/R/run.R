# Function file
source("function.R")

# Additional libraries
library(logger)
library(jsonlite)
library(RestRserve)

# Define constants
endpoint <- "/task/intentions" # URL path
port <- 8000 # Port for server operation
data_folder <- "data" # Directory for storing generated data

# Create a new application with CORS middleware
application <- Application$new(
  middleware = list(CORSMiddleware$new())
)

# Start the server
log_info("Starting server...", namespace = "server")

# Perform any required setup in this function
setup <- function() {
  # Configure the logger to use files
  if (dir.exists("logs") == FALSE) {
    dir.create("logs")
  }

  # Create a data folder to store any generated data
  if (dir.exists(data_folder) == FALSE) {
    dir.create(data_folder)
  }

  # Set the 'server' log level and namespace
  log_threshold(DEBUG, namespace = "server")
  log_appender(appender_tee(
    "./logs/server.log",
    append = TRUE,
    max_lines = Inf,
    max_bytes = Inf,
    max_files = 1L
  ), namespace = "server")
}

# Handler function called when data is received by the server
handler <- function(.req, .res) {
  # Display the host sending the request
  log_debug("Host: ", as.character(.req$headers["host"]), namespace = "server")

  # Extract any data and check for validity
  valid_contents <- TRUE

  # Reply with a HTTPError if any issues with the request contents
  if (valid_contents == FALSE) {
    log_error("Invalid request contents", namespace = "server")
    raise(HTTPError$bad_request())
  }

  log_success("Valid request received", namespace = "server")

  # Run the matching function
  log_debug("Running function...", namespace = "server")

  result <- example_function(1, 2)

  # Configure the response body
  .res$set_body(toJSON(list(
    sum = result
  )))
  .res$set_content_type("text/plain")
}

# Run the setup function
setup()

# Specify the API endpoint and handler
application$add_get(path = endpoint, FUN = handler)

# Start the server
backend <- BackendRserve$new()
backend$start(application, http_port = port)
