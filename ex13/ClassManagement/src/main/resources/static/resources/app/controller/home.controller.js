angular.module('mainApp').controller('HomeController', function ($scope, $window, $state) {
    $scope.currentUser = {
        name: $window.localStorage['username'] != '' ? $window.localStorage['username'] : 'Main Login',
        statusLogin: $window.localStorage['username'] != '' ? 'Logout' : 'Login'
    };
    $scope.goToProfile = function () {
        if ($window.localStorage['username'] !== '') {
            $state.go('profile');
        } else {
            $state.go('login');
        }

    };
    console.log("home controller");
});

