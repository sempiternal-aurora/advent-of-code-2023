<?php

class Game {
    public $id;
    public $draws;

    const COLOURS = array("red", "green", "blue");
    
    function __construct($gameString) {
        if (1 === preg_match_all("/Game [0-9]*:/", $gameString, $results)) {
            $this->id = (int) substr($results[0][0], 5);
            $throws = preg_replace("/Game [0-9]*: /", "", $gameString);
            $throws = preg_split("/; /", $throws);
            $draws = array();
            foreach ($throws as $draw) {
                $draw = preg_split("/, /", $draw);
                $temp = array();
                foreach ($draw as $cubes) {
                    $cube = preg_split("/ /", $cubes);
                    $temp[$cube[1]] = (int) $cube[0];
                }
                foreach (Game::COLOURS as $colour) {
                    if (!array_key_exists($colour, $temp)) {
                        $temp[$colour] = 0;
                    }
                }
                array_push($draws, $temp);
            }
            $this->draws = $draws;
        } else {
            throw new RuntimeException("Multiple or no Game IDs found");
        }
    }


    function is_possible($cubes) {
        $possible = true;
        foreach ($cubes as $colour=>$number) {
            foreach ($this->draws as $draw) {
                if ($draw[$colour] > $number) {
                    $possible=false;
                }
            }
        }
        return $possible;
    }


    function get_power() {
        $power = 1;
        foreach(Game::COLOURS as $colour) {
            $max = 0;
            foreach($this->draws as $draw) {
                if ($draw[$colour] > $max) {
                    $max = $draw[$colour];
                }
            }
            $power *= $max;
        }
        return $power;
    }
}

$file = fopen("input", "r");

$lines = preg_split("/\n/", fread($file, filesize("input")));

fclose($file);

$games = array();

foreach ($lines as $line) {
    if (strlen($line) > 4) {
        array_push($games, new Game($line));
    }
}

$cubes = array("red"=>12, "green"=>13, "blue"=>14);

$sum = 0;
$power_sum = 0;
foreach ($games as $game) {
    if ($game->is_possible($cubes)) {
        $sum += $game->id;
    }
    $power_sum += $game->get_power();
}
echo $power_sum;

?>