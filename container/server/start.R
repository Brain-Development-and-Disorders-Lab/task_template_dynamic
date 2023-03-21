# Libraries
library(config)
library(logger)
library(jsonlite)
library(RestRserve)

# Load configuration
config <- config::get()
endpoint <- config$endpoint # URL path
compute_function <- config$compute_function # Filepath of compute function
port <- config$port # Port for server operation
output <- config$output # Directory for storing generated data

# Function file
source(compute_function)

# Create a new application with CORS middleware
application <- Application$new(
  middleware = list(CORSMiddleware$new())
)

# Start the server
log_info("Starting RestRserve instance...", namespace = "server")

# Perform any required setup in this function
setup <- function() {
  # Configure the logger to generate log files
  if (dir.exists("logs") == FALSE) {
    dir.create("logs")
  }

  # Create an output folder to store any generated data
  if (dir.exists(output) == FALSE) {
    dir.create(output)
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
  # Host information extracted from request header
  host <- as.character(.req$headers["host"])
  log_debug("Request host: ", host, namespace = "server")

  # Extract parameters from the body of the request
  parameters <- .req$parameters_query

  # Run the compute function
  log_debug("Running compute function...", namespace = "server")
  result <- compute_function(parameters)

  # Configure the response body
  .res$set_body(toJSON(result))
  .res$set_content_type("text/plain")
}

# Run the setup function
setup()

# Specify the API endpoint and handler
application$add_get(path = endpoint, FUN = handler)

# Start the server
backend <- BackendRserve$new()
backend$start(application, http_port = port)
