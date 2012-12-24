angular.classmap = !(module, map)-->
	for clas, list of map
		let
			directive = ->
				restrict: \C
				link: !(scope, $el) ->
					$el.addClass list

			angular.module module
				.directive clas, directive

angular.screenermap = angular.classmap \screener


angular.module \screener, <[ jefri jquery ui ]>, !($routeProvider)->
	$routeProvider
		.when '/', template: jQuery.template \#keys
		.when '/keys', template: jQuery.template \#keys
		.when '/login', template: jQuery.template \#login

angular.screenermap do
	navDrop: "btn btn-navbar"
	menu: "navbar navbar-inverse navbar-fixed-top"
	content: "container"
	table: "table-striped"
