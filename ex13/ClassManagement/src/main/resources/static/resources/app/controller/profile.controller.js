angular.module('mainApp').controller('ProfileController', function ($scope, $window) {

    $scope.currentUser = {
        name: $window.localStorage['username'],
        statusLogin: $window.localStorage['username'] != '' ? 'Logout' : 'Login'
    };
    $scope.tab = 1;

    $scope.setTab = function (newTab) {
        $scope.tab = newTab;
    };

    $scope.isSet = function (tabNum) {
        return $scope.tab === tabNum;
    };

    google.charts.load('current', {packages: ["orgchart"]});
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Name');
        data.addColumn('string', 'Manager');
        data.addColumn('string', 'ToolTip');

        // For each orgchart box, provide the name, manager, and tooltip to show.
        data.addRows([
            [{v: 'Daniel', f: 'Daniel<div style="color:red; font-style:italic">Owner</div>'},
                '', 'Owner'],
            [{v: 'Mike', f: 'Mike<div style="color:red; font-style:italic">Agent Manager</div>'},
                'Daniel', 'Agent Manager'],
            [{v: 'Alice', f: 'Alice<div style="color:red; font-style:italic">Agent Manager</div>'},
                'Daniel', 'Agent Manager'],
            [{v: 'A', f: 'A<div style="color:red; font-style:italic">Agent</div>'},
                'Mike', 'Agent'],
            [{v: 'B', f: 'B<div style="color:red; font-style:italic">Agent</div>'},
                'Mike', 'Agent'],
            [{v: 'C', f: 'C<div style="color:red; font-style:italic">Agent</div>'},
                'Mike', 'Agent'],
            [{v: 'D', f: 'D<div style="color:red; font-style:italic">Agent</div>'},
                'Mike', 'Agent'],
        ]);

        // Create the chart.
        var chart = new google.visualization.OrgChart(document.getElementById('chart_div'));
        // Draw the chart, setting the allowHtml option to true for the tooltips.
        chart.draw(data, {allowHtml: true});
    }
});


