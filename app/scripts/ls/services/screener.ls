screener = (JEFRi)->
	class Screener
		->
			JEFRi.ready.then !~>
				@load!

		load: !->
			screenings = [
				["abcd", "David"],
				["1234", "Stan"],
				["asfd", "Jon"]
			]
			@screenings = for screening in screenings
				JEFRi.build \Key, {name: screening[1], screening_key: screening[0]}

			@loaded <: @screenings

		screenings: []

	new Screener!

angular.module \screener
	.factory \Screener, [\JEFRi, screener]