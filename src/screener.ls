require! { server: "jefri-server", express }

server.get '/', !(req, res)->
	res.sendfile "build/index.html"

server.use '/', express.static 'build/'

server.jefri.runtime.load 'http://localhost:3000/secure-screener.json'

server.listen 3000