const path = require('path');

const unknownEndpointBuilder = (currentPath) => {
    const unknownEndpoint = (_request, response) => {
        response.status(404).sendFile(path.join(currentPath + "/static/notFound.html"));
    };
    return unknownEndpoint;
}

module.exports = {
    unknownEndpointBuilder
};