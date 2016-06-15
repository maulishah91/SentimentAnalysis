<?php
require_once('TwitterAPIExchange.php');
require_once('includes/keys.php');
require_once('db-connect.php');

$settings = array(
    'oauth_access_token' => OAUTH_ACCESS_TOKEN,
    'oauth_access_token_secret' => OAUTH_ACCESS_TOKEN_SECRET,
    'consumer_key' => CONSUMER_KEY,
    'consumer_secret' => CONSUMER_SECRET
);

$url = 'https://api.twitter.com/1.1/search/tweets.json';
$requestMethod = 'GET';

$select_query = "select * from hashtags";
$retval = mysql_query($select_query);
if (!$retval) {
    die('Could not get data: ' . mysql_error());
} else {
    while($row = mysql_fetch_array($retval)) {
    	$getfield = '?q='.$row[2].'&lang=en&count=10&since_id='.$row[3];
    	#$getfield = '?q=#UCLA&count=3&since_id=0743155561215078400';
		$twitter = new TwitterAPIExchange($settings);
		$result =  $twitter->setGetfield($getfield)
		    ->buildOauth($url, $requestMethod)
		    ->performRequest();

		$response = json_decode($result, true);
		$file = fopen("../python/input/".$row[1].".csv","w");

		foreach($response['statuses'] as $tweet) {
	 	    $id = $tweet['id'];
	 	    $timestamp = strtotime($tweet['created_at']);
	 	    #$normalized_timestamp = $tweet['text'];
	 	    $text = $tweet['text'];
	 	    $text = trim(preg_replace('/\s+/', ' ', $text));
	 	    $text = preg_replace('/[,]/', '', $text);
	 	    $text = trim($text, ',');
			fwrite($file,$text."\n");
			$insert_query = "insert into tweets(tweetId, university, raw_timestamp) values('".$id."','".$row[1]."',".$timestamp.")";
			$insert_retval = mysql_query($insert_query);
			if (!$insert_retval) {
    			die('Could not insert into table: ' . mysql_error());
			}
		}
		
		fclose($file);

		$sinceidstr= $response['search_metadata']['refresh_url'];
		$sinceidarr = explode("&",$sinceidstr);
		$since_id = explode("=",$sinceidarr[0]);

		$update_query = "update hashtags set since_id='".$since_id[1]."' where university='".$row[1]."'";
		$update_retval = mysql_query($update_query);
		if (!$update_retval) {
    		die('Could not update table: ' . mysql_error());
		}
	#break;
   }
}

?>