screener = (JEFRi)->
	# The Screener service is all the application's specific logic.
	class Screener
		->
			# Load our data once the JEFRi context is available for use.
			JEFRi.ready.then !~>
				@load!

		# Refresh local data from the server.
		load: !->
			JEFRi.get {_type: \Key } .then !~>
				@screenings = JEFRi.find _type: \Key
				# Inform interested parties new data is available.
				@loaded <: @screenings

		# Send all our data to the server.
		save: !->
			JEFRi.save @screenings

		# Add a new screening
		create: !->
			# Default data. Would be nice to specify this in the context...
			@screenings.push JEFRi.build \Key, {name: "New Screener", screening_key: "blank"}
			# Update listeners with new data.
			@loaded <: @screenings

		# Validate whether the user requested a known key.
		check: (key)->
			# Since we have all the keys  locally, just loop through and check if it's there.
			for screening in @screenings
				if screening.screening_key! is key
					return true
			false

		screenings: []

	new Screener!

angular.module \screener
	.factory \Screener, [\JEFRi, screener]
