'use strict';
	
	var app = angular.module('elCumpleanieroApp', []);
	
    app.factory('ParticipantsRest', function($http) {
	    return function() {
	        this.findAll = function(callback) {
	            $http.get('/participants').success(callback);
	        }
	        
	        this.update = function(participant, callback) {
	            $http.post('/participants/' + participant.id).success(callback);
	        }
	    }
	});
	
	app.controller('PersonasCtrl', function ($scope,ParticipantsRest) {
		
	var participantsRest = new ParticipantsRest;
	
    //$scope.persons = null;
    $scope.persons = [{name:"Lucas", birthday:"10/11/1990"},{name:"Liza", birthday:"10/5/1993"},{name:"Camila", birthday:"10/5/1993"}];
    
    $scope.updateList = function() {
    	//participantsRest.findAll(function(data){ 
        //	$scope.persons = data;
    	//});
        $scope.selectedParticipant.name = $scope.nameToAssignToParticipant
        $scope.selectedParticipant.birthday = $scope.birthdayToAssignToParticipant
    }
    
    //$scope.updateList();
    
	$scope.selectedParticipant = null;
    $scope.nameToAssignToParticipant = "";
    $scope.birthdayToAssignToParticipant = "";
    $scope.regExpNombre = "([A-Z][a-z]*)([\\s\\\'-][A-Z][a-z]*)*";
    $scope.regExpFecha = "(0?[1-9]|[12][0-9]|3[01])/(0?[1-9]|1[012])/((19|20)\\d\\d)";

    /**
     *	return if not exist participants.
     */
     $scope.notExistParticipants = function(){
    	 return  $scope.persons == null;
    }
    
    /**
     *	return if the input has a valid name to assign to the participant.
     */
     $scope.isAValidName = function(){
     		return new RegExp($scope.regExpNombre).test($scope.nameToAssignToParticipant);
     }

    /**
     *	return if the input has valid date to assign to the participant.
     */
     $scope.isAValidDate = function(){
     		return new RegExp($scope.regExpFecha).test($scope.birthdayToAssignToParticipant);
     }

    /**
     *	return if the input has a invalid name to assign to the participant and not exist a participant selected.
     */
     $scope.isAInvalidName = function(){
     		return !($scope.isAValidName()) && !($scope.isSelectedParticipantNull());
     }

    /**
     *	return if the input has a invalid name to assign to the participant and not exist a participant selected.
     */
     $scope.isAInvalidDate = function(){
     		return !($scope.isAValidDate()) && !($scope.isSelectedParticipantNull());
     }

    /**
     *	return if the name input is empty.
     */
     $scope.isEmptyNameInput = function(){
     		return $scope.nameToAssignToParticipant.length == 0;
     }

    /**
     *	return if the date input is empty.
     */
     $scope.isEmptyDateInput = function(){
     		return $scope.birthdayToAssignToParticipant.length == 0
     }

    /**
     *	Change the class of the inputs and icons to obtain green or red color in the inputs and icons 
     *		depending on the given condition.
     */
	 $scope.changeInputsAndIconToRedOrGreen = function(aCondition,aInputId,aIconId){
		 if(aCondition){
			document.getElementById(aInputId).className = "form-group has-success has-feedback";
	    	document.getElementById(aIconId).className = "glyphicon glyphicon-ok form-control-feedback";
	    }
	    else{
	    	document.getElementById(aInputId).className = "form-group has-error has-feedback";
	    	document.getElementById(aIconId).className = "glyphicon glyphicon-remove form-control-feedback";
	    }
	 }
	 
	/**
     *	Change the class of the inputs and icons to obtain
     *		blank(if the inputs has no changes compare to the selected Participant's name and birthday), green or red color
     *		  in the inputs and icons depending on the given condition.
     */
     $scope.changeDivClassIfAConditionIsTrue = function(aCondition,aInputId,aIconId){
    	if($scope.isNoChangeInAnyData()){
    		$scope.changeInputsToNormalView();
	    }
	    else{
	    	$scope.changeInputsAndIconToRedOrGreen(aCondition,aInputId,aIconId);
	    }
     }

    /**
     *	Change the class of the inputs and icons to obtain blank color in the inputs and icons.
     */
	 $scope.changeDivClass= function(aInputId,aIconId){
		document.getElementById(aInputId).className = "form-group";
	    document.getElementById(aIconId).className = "";
	 }

    /**
     *	Change the class of the name inputs and icons.
     */
     $scope.changeNameDivClass = function(){	
    	$scope.changeDivClassIfAConditionIsTrue($scope.isAValidName(),"nameInput","nameIcon");
     }

    /**
     *	Change the class of the date inputs and icons.
     */
     $scope.changeDateDivClass = function(){
    	$scope.changeDivClassIfAConditionIsTrue($scope.isAValidDate(),"dateInput","dateIcon");
     }

    /**
     *	Reset the class of the name and date inputs and icons.
     */
     $scope.changeInputsToNormalView = function(){
    	$scope.changeDivClass("nameInput","nameIcon");
    	$scope.changeDivClass("dateInput","dateIcon");
     }

    /**
     *	return if exist a selected participant.
     */
	 $scope.isSelectedParticipantNull = function(){
    	return $scope.selectedParticipant == null;
     }

    /**
     *	return if the name and date birthday in the inputs is equals to the participant's name and date birthday.
     */
     $scope.isNoChangeInAnyData = function(){
    	return $scope.selectedParticipant.name == $scope.nameToAssignToParticipant && 
    	$scope.selectedParticipant.birthday == $scope.birthdayToAssignToParticipant;
     }

    /**
     *	return if the name and date birthday in the inputs is empty.
     */
	 $scope.isBlankAnyData = function(){
    	return $scope.isEmptyNameInput() || $scope.isEmptyDateInput();
     }

    /**
     *	return if the name and date birthday in the input are valid and there's not empty inputs and the inputs has no changes.
     */
     $scope.dataIsNotCorrectToAbleTheSubmitButton = function(){
    	return !($scope.isAValidName()) || !($scope.isAValidDate()) || $scope.isBlankAnyData() || $scope.isNoChangeInAnyData();
     }

    /**
     *	set any data from the selected participants and reset the inputs color o blank.
     */
     $scope.setSelectedParticipantData = function(aParticipant){
        $scope.nameToAssignToParticipant = aParticipant.name;
    	$scope.birthdayToAssignToParticipant = aParticipant.birthday;
    	$scope.selectedParticipant = aParticipant;
    	$scope.changeInputsToNormalView();
     }

    /**
     *	return if the participant is the selected participant from the list.
     */
     $scope.isThisParticipantTheSelectedParticipant = function (aParticipant) {
     	return (aParticipant == $scope.selectedParticipant);
     }
     
    /**
     *	update the local participantList and chague all inputs to normal view.
     */
     $scope.localUpdate = function(){
    	 $scope.updateList();
         $scope.changeInputsToNormalView();
     }
     
    /**
     *	update's participants name and birthday to the new one's.
     */
     $scope.updateParticipantData = function(){
    	 participantsRest.update($scope.selectedParticipant, $scope.localUpdate());
     }

});