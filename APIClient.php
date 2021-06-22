<?php
/* Made by Red16 */

//this is the end of the url
$user = $_GET['api'];

if($user){
    //amount of time users subscription is active, should the user id be block? 0 = No 1 = TRUE, just users name it dose nothing
    function subscriptionManager($setDate, $setBlacklisted, $userName) {
    	$date = new DateTime("$setDate 00:00:00");
    	$date->modify("-1 day");

    	$datenum=strtotime($date->format("Y-m-d H:i:s"));
    	$diff=$datenum-time();
   		$days=floor($diff/(60*60*24)+2);//seconds/minute*minutes/hour*hours/day)
    	$hours=round(($diff-$days*60*60*24)/(60*60));
    
  		$blacklisted="$setBlacklisted";
    	$finishedString = "$days,$blacklisted,".$date->format("Y-m-d H:i:s");
        return $finishedString;
    }

    //this should be device unique id '100' change that for every user make a if statement for each user and add a date etc￼￼
    if($user == '100'){
        echo subscriptionManager("2022-03-08", "0", "iosnab");
    }
    //note 200 will be user identifier id. User will copy id when Modmenu appears and they will show it to you, you put it here 

    //to block the user device set 0 to 1.
    if($user == '200'){
        echo subscriptionManager("2023-03-08", "1", "iosnab");
    }
}
?>