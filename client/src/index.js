/**
 * @file 'Client' class managing the sending and receiving of remote
 * resources. The 'axios' request library is used, and the class is
 * initialised with a URL for the endpoint to request data from.
 * @author Henry Burgess <henry.burgess@wustl.edu>
 */

// Logging library
import consola from "consola";

// Request library
import axios from "axios";

/**
 * @summary Client class used to connect and submit jobs to a remote computing
 * resource.
 */
class Client {
  // URL of the endpoint receiving requests
  resourceURL;

  /**
   * Default constructor
   * @param {string} URL default URL of the computing resource
   * @class
   */
  constructor(URL) {
    this.resourceURL = URL;
    consola.debug(`Querying URL: ${this.resourceURL}`);
  }

  /**
   * Get the URL pointing to the server resource and
   * its public APIs
   * @return {string}
   */
  getResourceURL() {
    return this.resourceURL;
  }

  /**
   * Update the resource URL
   * @param {string} URL the URL to the computing resource
   */
  setResourceURL(URL) {
    this.resourceURL = URL;
  }

  /**
   * Submit a new computing job to the remote resource
   * @param {any} params request parameters
   * @param {function(data: any): void} onSuccess
   * @param {function(data: any): void} onError
   */
  submit(params, onSuccess, onError) {
    const startTime = performance.now();

    axios
      .get(this.resourceURL, {
        params: params,
      })
      .then((response) => {
        // Attempt to handle the response and extract the data
        if (response["data"]) {
          // Pass the data to the callback
          onSuccess(response.data);
        } else {
          consola.warn("No data received");
        }
      })
      .catch((error) => {
        onError(error);
      })
      .then(() => {
        const endTime = performance.now();
        consola.info(
          `Communication complete after ${Math.round(endTime - startTime)}ms`
        );
      });
  }
}

export default Client;
