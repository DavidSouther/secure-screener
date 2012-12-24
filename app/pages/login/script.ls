login = !($scope, Screener)->
	$scope <<<
		check: !(key)->
			gate = Screener.check key
			if gate
				document.location = "#/watch"
			else
				$scope.reject = yes
				# If we aren't updating the view, update the view.
				unless $scope.$$phase then $scope.$apply!

angular.module \screener
	.controller \Login, [\$rootScope, \Screener, login]

angular.screenermap do
	rejection: "alert alert-error"