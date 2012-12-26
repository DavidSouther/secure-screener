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

# The screener app is a typical single-page web application.
# It depends on our common libraries, and configures some routes.
angular.module \screener, <[ jefri jquery ui ]>, !($routeProvider)->
	$routeProvider
		# /keys is the default view.
		.when '/', template: jQuery.template \#keys
		.when '/keys', template: jQuery.template \#keys
		# Pages are kept under #templates in the markup. When requesting
		# a page, angular will use the template markup returned by 
		# jQuery.template.
		.when '/login', template: jQuery.template \#login

# A variety of bootstrap classes for our semantic classes.
angular.screenermap do
	navDrop: "btn btn-navbar"
	menu: "navbar navbar-inverse navbar-fixed-top"
	content: "container"
	table: "table-striped"
