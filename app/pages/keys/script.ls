keys = !($scope, Screener)->
	$scope <<<
		screenings: Screener.screenings
		create: Screener.create
		save: Screener.save
		load: Screener.load

	Screener.loaded :> !->
		$scope.screenings = it
		unless $scope.$$phase then $scope.$apply!

angular.module \screener
	.controller \Keys, [\$rootScope, \Screener, keys]

angular.screenermap do
	create: "btn btn-primary"
	save: "btn"
	load: "btn"