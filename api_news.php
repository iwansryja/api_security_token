<?php

function getRegisteredAPI(){
	return ["678", "321", "909"];
}

function isInputValid($inputs){
	$APIkey = $inputs["api_key"];

	if (in_array($APIkey, getRegisteredAPI())){
		return true;
	} else {
		return false;
	}

}

function jsonOutput($status, $message, $data){
	$response = ["status" => $status, "message" => $message, "data" => $data];
	header("Content-type: application/json");
	echo json_encode($response);
}

function getNewsData(){
	$news = [
		["title" => "lorem", "content" => "ipsum", "writter" => "rudi"],
		["title" => "blobs", "content" => "likse", "writter" => "arip"],
		["title" => "huolo", "content" => "opuls", "writter" => "sandi"]
	];

	return $news;

}

// Cek input

if (isset($_GET['api_key'])) {
	if (isInputValid($_GET)){
			jsonOutput ("success", "Api key is valid", getNewsData());
	} else {
			jsonOutput ("failed", "Invalid Api key!", null);
	}
} else {
	http_response_code(400);
}
