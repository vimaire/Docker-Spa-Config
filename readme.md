# Description 
This repository is an exemple of dockerizing a web application and using the same image against different backends (dev, staging, prod). This means the image must be able to take in environment variables and make the web application use it.

This exemple is illustrated by using the "create-react-app" with a custom message.

For enterprise use cases, think about configuration file containing  api urls.

# Instructions
1. pull this repository
2. run the following command
```shell
docker run -p 3000:80 -e "CFG_MESSAGE=Hello docker" --rm -it  $(docker build -q .)
```
3. open your browser on port 3000 and see the message "Hello docker" on the main page
# How it works
## SPA Side
We added a static js file "configuration.js" writing configuration data to the environment (here it's in the window object but you can put it anywhere you like).

in the "App" component, on the render method, we used `window.__configuration__.message` field.

## Server side
The server has two main functions :
* Generating dynamically the configuration file at startup.
(for more instructions, see [read-env](https://www.npmjs.com/package/read-env) npm package)
* Serving the static files


