<?php
$hostname = "localhost";
$username = "root";
$password = "sesame";
 
try {
    $db = new PDO("mysql:host=$hostname;dbname=ChaoticCoders", $username, $password);
    //echo "Connected to database"; // check for connection

    $userId = $_POST["inputUserId"];

    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING);
 
    $sql = "SELECT U.user_id, U.name, U.level, UP.pokemon_id, UP.pokemon_level, UP.pokemon_strength, PO.pokemon_name, PO.pokemon_type FROM User AS U, User_Pokedex AS UP, Pokemons AS PO WHERE U.user_id = UP.user_id AND PO.pokemon_id = UP.pokemon_id AND U.user_id = $userId";
    $prepareStatement = $db->prepare($sql);
    $prepareStatement->execute();
    $result = $prepareStatement->fetchAll(PDO::FETCH_ASSOC);
    /*foreach ($result as $row) {
        echo $row["user_id"] ." - ". $row["name"] ." - ". $row["level"] ." - ". $row["pokemon_id"] ." - ". $row["pokemon_strength"] ." - ". $row["pokemon_name"] ." - ". $row["pokemon_type"] ." - ". $row["pokemon_level"] . "<br />";
    }*/

    print "<table border='1'>\n";
                $doHeader = true;
                foreach ($result as $row) {
                    if ($doHeader) {
                        print "        <tr>\n";
                        foreach ($row as $name => $value) {
                            print "            <th>$name</th>\n";
                        }
                        print "        </tr>\n";
                        
                        $doHeader = false;
                    }
                    print "            <tr>\n";
                    foreach ($row as $name => $value) {
                        print "                <td>$value</td>\n";
                    }
                    print "            </tr>\n";
                }
                
                print "        </table>\n";

    }
catch(PDOException $e)
    {
    echo $e->getMessage();
    }
?>