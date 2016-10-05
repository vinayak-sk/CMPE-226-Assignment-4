<?php
$hostname = "localhost";
$username = "root";
$password = "sesame";
 
try {
    $db = new PDO("mysql:host=$hostname;dbname=ChaoticCoders", $username, $password);
    //echo "Connected to database"; // check for connection

    $userId = $_POST["inputUserId"];

    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING);
 
    /*$sql = "SELECT U.USER_ID, U.NAME, U.LEVEL, UP.POKEMON_ID, UP.POKEMON_STRENGTH, P.POKEMON_NAME, P.POKEMON_TYPE FROM USER AS U, USER_POKEDEX AS UP, POKEMONS AS P WHERE U.USER_ID = $userId AND UP.USER_ID = $userId AND P.POKEMON_ID = UP.POKEMON_ID GROUP BY P.POKEMON_TYPE";*/
    $sql = "SELECT U.USER_ID, U.NAME, U.LEVEL, UP.POKEMON_ID, UP.POKEMON_LEVEL, P.POKEMON_NAME, P.POKEMON_TYPE FROM USER_POKEDEX AS UP, USER AS U, POKEMONS AS P WHERE U.user_id = $userId AND UP.USER_ID = U.USER_ID AND P.POKEMON_ID=UP.POKEMON_ID GROUP BY U.USER_ID, U.NAME, U.LEVEL, UP.POKEMON_ID, UP.POKEMON_LEVEL, P.POKEMON_NAME, P.POKEMON_TYPE ";
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