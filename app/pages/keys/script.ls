keys = !($scope, Screener)->
	$scope.screenings = Screener.screenings
	Screener.loaded :> !->
		$scope.screenings = it
		unless $scope.$$phase then $scope.$apply!

angular.module \screener
	.controller \Keys, [\$rootScope, \Screener, keys]