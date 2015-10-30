angular.module('simpleNotes', [])
  .controller('PagesController',
    function($scope) {
      $scope.pages = [
        {
          id: "1",
          title: "Ruby",
          author: "Janne"
        },
        {
          id: "2",
          title: "Rails",
          author: "Janne"
        }
      ];
    });
