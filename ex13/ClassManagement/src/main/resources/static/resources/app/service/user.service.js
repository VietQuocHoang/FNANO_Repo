'use strict';
angular.module('mainApp').factory('UserFactory', ['Config', '$http', '$window',
    function (Config, $http, $window) {
        return {
            login: function (userName, password) {
                var url = Config.api + 'users/login';
                return $http.post(url, {
                    userName: userName,
                    password: password
                });
            }
        };
    }]);


