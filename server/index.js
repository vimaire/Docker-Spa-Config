const fs = require('fs');
const express = require('express');
const app = express();
var compression = require('compression')
const readEnv = require('read-env').default;

// create configuration file from environment variables
const options = readEnv('CFG');
const fileContent = `(function () {
    window.__configuration__ = ${JSON.stringify(options)}
})();
`;
app.disable('x-powered-by');
app.use(compression());
app.use(express.static('public'));

fs.writeFile('public/configuration.js', fileContent, err => {
    if (err) {
        throw err;
    }

    app.listen(80, function () {
        console.log("listening...");
    })
});