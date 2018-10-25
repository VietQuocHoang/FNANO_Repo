angular.module('mainApp').controller('LoginController', function ($scope, $state, $window, growl, UserFactory, Notification) {
    $scope.user = {
        userName: "",
        password: ""
    };

    $scope.checkLogin = function (user) {
        if (user.userName === '' || user.password === '') {
            Notification.error({message: 'Please check your information', delay: 1000});
            return false;
        } else {
            UserFactory.login(user.userName, user.password).then(function (resp) {
                if (resp.data === "") {
                    Notification.error({message: 'Login fail. Please check your username and password', delay: 1000});
                } else {
                    $window.localStorage['username'] = resp.data.userName;
                    Notification.success({message: 'Login successful', delay: 1000});
                    $state.go('admin');
                }

            });
        }

    };
});

