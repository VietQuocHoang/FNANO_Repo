'use strict';

angular.module('mainApp', [
    'ngSanitize',
    'ngAnimate',
    'ui.router',
    'ui.bootstrap',
    'angular-growl',
    'ui-notification',
    'angular-loading-bar'
]).config(function (cfpLoadingBarProvider, $stateProvider, $urlRouterProvider, NotificationProvider) {
    NotificationProvider.setOptions({
        delay: 10000,
        startTop: 20,
        startRight: 10,
        verticalSpacing: 20,
        horizontalSpacing: 20,
        positionX: 'left',
        positionY: 'bottom'
    });
    $stateProvider
        .state('admin', {
            url: '/',
            templateUrl: 'resources/app/templates/home.html',
            controller: 'HomeController'
        })
        .state('profile', {
            url: '/profile',
            templateUrl: 'resources/app/templates/profile.html',
            controller: 'ProfileController'
        })
        .state('login', {
            url: '/login',
            templateUrl: 'resources/app/templates/login.html',
            controller: 'LoginController'
        });
    cfpLoadingBarProvider.includeSpinner = true;
    cfpLoadingBarProvider.includeBar = true;
    $urlRouterProvider.otherwise('/login');
}).run(function ($rootScope) {

}).controller('TopController', ['$scope', '$window', function ($scope, $window) {
    console.log("TopController");
    $scope.currentUser = {
        name: $window.localStorage['username'],
        statusLogin: $window.localStorage['username'] != '' ? 'Logout' : 'Login'
    };
}]).directive('leftMenu', function ($rootScope) {
    return {
        restrict: 'AE',
        templateUrl: 'resources/app/templates/leftmenu.html',
        link: function (scope, elm) {
//			
        }
    };
}).directive('topMenu', function ($rootScope) {
    return {
        restrict: 'AE',
        templateUrl: 'resources/app/templates/topmenu.html',
        link: function (scope, elm) {
//			
        }
    };
});


