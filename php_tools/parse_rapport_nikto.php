<?php

$path = "../BigMapC/rapportNikto.txt";
$handle = @fopen($path, "r");
$i = 0;
$CleanTab = array(); 
$FinalTab = array();
$pieces = array();
$pieces_lenght = 0;
$buffer;


//push buffer in pieces array
if ($handle) {
    while (($buffer = fgets($handle, 4096)) !== false) 
    {	
		$pieces = explode(" ", $buffer);
	}
    //ERROR
    if (!feof($handle)) 
    {
        echo "Erreur: fgets() a échoué\n";
    }
}
$pieces_lenght = count($pieces);
$point = $pieces_lenght - 1;

//parse pieces array and push open port in Clean file 
for($i = 0; $i <= $point; $i++)
	{
		if (preg_match("/\bTarget IP:\b/i", $pieces[$i])) 
		{
		 	$CleanTab[$i] = $pieces[$i];
 		}
 		elseif (preg_match("/\bTarget Hostname:\b/i", $pieces[$i]) 
 		{

 		}
 		elseif (preg_match("/\bServer:\b/i", $pieces[$i]) 
 		{

 		}
 		elseif (preg_match("/\bServer:\b/i", $pieces[$i]) 
 		{

 		}
   	$i++;
    }

    var_dump($CleanTab);

$comma_separated = implode("\r\n", $CleanTab);
file_put_contents('CleanNmap.txt', print_r($comma_separated, true));



?>