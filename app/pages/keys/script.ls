keys = !($scope, Screener)->
	# Inadvertently, all the behaviors the view needs happen to be
	# methods in the Screener service.
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

# Style some buttons!
angular.screenermap do
	create: "btn btn-primary"
	save: "btn"
	load: "btn"