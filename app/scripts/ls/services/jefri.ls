angular.module \jefri, []
	.factory \JEFRi, ->
		rt = new JEFRi.Runtime "secure-screener.json"
		JEFRi.Runtime:: <<<
			run: (which, ents)->
				t = new window.JEFRi.Transaction!
				t.add ents
				storeOptions =
					remote: @settings.ENDPOINT
					runtime: @
				s = new window.JEFRi.Stores.PostStore storeOptions
				s.execute which, t

			save: (ents)->
				@run 'persist', ets

			get: (spec={})->
				@run 'get', spec

			config: !(endpoint="http://localhost:3000/")->
				@settings.ENDPOINT = endpoint

		rt <<<
			settings:
				ENDPOINT: "http://localhost:3000/"

		rt