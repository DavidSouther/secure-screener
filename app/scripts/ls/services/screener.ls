screener = (JEFRi)->
	class Screener
		->
			JEFRi.ready.then !~>
				@load!

		load: !->
			JEFRi.get {_type: \Key } .then !~>
				@screenings = JEFRi.find _type: \Key
				@loaded <: @screenings

		save: !->
			JEFRi.save @screenings

		create: !->
			@screenings.push JEFRi.build \Key, {name: "New Screener", screening_key: "blank"}
			@loaded <: @screenings

		check: (key)->
			for screening in @screenings
				if screening.screening_key! is key
					return true
			false

		screenings: []

	new Screener!

angular.module \screener
	.factory \Screener, [\JEFRi, screener]
