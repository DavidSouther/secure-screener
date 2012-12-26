login = !($scope, Screener)->
	$scope <<<
		check: !(key)->
			# Pass on to the watch page if it's a valid page.
			if Screener.check key
				document.location = "#/watch"
			else
				# If it's not a valid key, flash a reject message.
				$scope.reject = yes
				# If we aren't updating the view, update the view.
				unless $scope.$$phase then $scope.$apply!

angular.module \screener
	.controller \Login, [\$rootScope, \Screener, login]

angular.screenermap do
	rejection: "alert alert-error"