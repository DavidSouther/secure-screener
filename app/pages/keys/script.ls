keys = !($scope, Screener)->
	$scope.screenings = Screener.screenings
	$scope.create = Screener.create
	$scope.save = Screener.save
	Screener.loaded :> !->
		$scope.screenings = it
		unless $scope.$$phase then $scope.$apply!

angular.module \screener
	.controller \Keys, [\$rootScope, \Screener, keys]

angular.screenermap do
	create: "btn btn-primary"
	save: "btn"