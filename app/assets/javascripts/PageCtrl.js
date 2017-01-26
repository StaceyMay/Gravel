(function () {
  "use strict";

  angular.module("app").controller("pageCtrl",['$scope', '$http', function($scope, $http) {

    // $scope.onLoad() = function(){


    // }
    // $scope.initialize = function() {
    //   $http({
    //     method: "GET",
    //     url: '/.json'
    //   })
    // }
    // $scope.saveVotes = function(id){
    //   console.log(current_task.id)
    //   $http({
    //     method: 'POST',
    //     url: URL + '/places/' + id,
    //     // add remaining fields
    //     data: { 
    //       user_id: current_user.id
    //       place_id: 
    //        }
    //   }).then(function successCallback(response) {
    //         alert("You Voted!");
    //     }, function errorCallback(response) {
    //       // called asynchronously if an error occurs
    //       // or server returns response with an error status.
    //   });
    // }

    $scope.addVote = function(newPlace, newUser) {
      // $scope.places = vote + 1;
      $http({
        method: 'POST',
        url: '/votes.json',
        data: {
          user_id: newUser,
          place_id: newPlace
        },
      }).then(function successCallback(response) {
        // this callback will be called asynchronously
        // when the response is available
        var place_id = "place-" + newPlace;
        var vote_count = document.getElementById(place_id);
        vote_count.innerHTML = parseInt(vote_count.innerHTML) + 1;

        var vote_button_id = "vote-" + newPlace;
        var vote_button = document.getElementById(vote_button_id);
        vote_button.innerHTML = '';
      }, function errorCallback(response) {
        // called asynchronously if an error occurs
        // or server returns response with an error status.
        alert('You cannot vote more than once');
      });
    }

      }]);
}) ();