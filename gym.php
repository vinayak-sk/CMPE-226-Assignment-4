<?php
$hostname = "localhost";
$username = "root";
$password = "sesame";
 
try {
    $db = new PDO("mysql:host=$hostname;dbname=ChaoticCoders", $username, $password);
    //echo "Connected to database"; // check for connection

    $gymId = $_POST["gymId"];

    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING);
 
    $sql = "SELECT GM.USER_ID, U.NAME, G.GYM_NAME FROM USER AS U, GYM AS G, GYM_MASTERS AS GM WHERE GM.USER_ID=U.USER_ID AND GM.GYM_ID=$gymId AND G.GYM_ID = GM.GYM_ID";
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