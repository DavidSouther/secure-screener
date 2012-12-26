# `jefri-server` provides an express server configured to handle jefri
# transactions, so we'll use that first. We also need to do some express things. 

require! { server: "jefri-server", express }

# The jefri-server runtime doesn't have a default context, load the app's.
server.jefri.runtime.load 'http://localhost:3000/secure-screener.json'

# Use index.html for /
server.get '/', !(req, res)->
	res.sendfile "build/index.html"

# Otherwise, serve requests as static files from build/
server.use '/', express.static 'build/'

# Start the server.
server.listen 3000