Short = ->
	(id)->
		"(#{id.substring 0, 8})"

angular.module \jefri
	.filter \shortId, Short