<?php
$hostname = "localhost";
$username = "root";
$password = "sesame";
 
try {
    $db = new PDO("mysql:host=$hostname;dbname=ChaoticCoders", $username, $password);
    //echo "Connected to database"; // check for connection

    $healthId = $_POST["healthId"];

    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING);
 
    $sql = "SELECT HC.HEALTH_CENTER_NAME, HC.HEALTH_CENTER_ID, HR.POTIONS, HR.POTIONS, HR.POKEBALLS FROM HEALTH_CENTER AS HC, HEALTH_CENTER_RESOURCES AS HR WHERE HC.HEALTH_CENTER_ID = HR.HEALTH_CENTER_ID AND HC.HEALTH_CENTER_ID=$healthId ";
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