[Home](../index.md) > Deployment > Configuration of Gorilla

# Deployment - Configuration of Gorilla

> Note: Most of this guide applies only to games under the Brain Development and Disorders Lab GitHub.

> Note: In this guide, you work primarily with the game, not the server.

To prepare for deployment to Gorilla, first follow the instructions in the game README.md file to install the Yarn package manager. Then, run the command `yarn` in the root directory of the game to install all dependencies for the game.

## Building the game

After ensuring all dependencies are installed, run the following command to build the game:

```Shell
$ yarn build
```

OR, for games that include a server component:

```Shell
$ yarn build:game 
```

This will generate files in a `dist/` directory.

## Uploading files to Gorilla

Working in the `dist/` directory, a number of files may need to be uploaded to Gorilla. Upload the `index.js` file to the _Resources_ tab in the Gorilla task. If any images accompanied the task, they will have been placed in a separate `img/` directory. Upload the images to the _Stimuli_ tab in the Gorilla task.

## Integration with Gorilla

To finalize integration with Gorilla, ensure that _Use Head_, _Use Manipulations_, and _Use Metrics_ are selected under the _Toolbox_ tab in the Gorilla task.

### Resources

After uploading `index.js` as a task resource, add the following line under the _Head_ tab in the Gorilla task:

```HTML
<script src="{{ resource 'index.js' }}" defer></script>
```

### Manipulations

If any manipulations have been configured in the task, populate the _Manipulations_ tab with the exact keys and predefined values outlined in the task configuration file.

### Metrics

The keys listed in _Metrics_ should align exactly with the data points being recorded by jsPsych.
