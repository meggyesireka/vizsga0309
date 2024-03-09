<!-- Most hozzuk létre a upload.php szkriptet, amely fogadja és kezeli a képfeltöltést. 
A következő egy egyszerű példa, amely a feltöltött fájlt a uploads könyvtárba teszi: -->

<!-- Ez a PHP szkript ellenőrzi a feltöltött kép méretét, típusát, és elmenti a uploads könyvtárba. 
Természetesen ez csak egy egyszerű példa, és egy valóságban használt alkalmazásban további biztonsági ellenőrzésekre 
és kezelésekre lenne szükség. -->
<?php
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_FILES["file"])) {
    $targetDir = "uploads/";
    $targetFile = $targetDir . basename($_FILES["file"]["name"]);
    $uploadOk = 1;
    $imageFileType = strtolower(pathinfo($targetFile, PATHINFO_EXTENSION));

    // Ellenőrizzük, hogy a fájl valóban kép-e
    $check = getimagesize($_FILES["file"]["tmp_name"]);
    if ($check === false) {
        echo "A fájl nem kép.";
        $uploadOk = 0;
    }

    // Ellenőrizzük, hogy a fájl már létezik-e
    if (file_exists($targetFile)) {
        echo "A fájl már létezik.";
        $uploadOk = 0;
    }

    // Ellenőrizzük a fájlméretet
    if ($_FILES["file"]["size"] > 500000) {
        echo "A fájl mérete túl nagy.";
        $uploadOk = 0;
    }

    // Engedélyezzük bizonyos fájltípusokat
    $allowedTypes = array("jpg", "jpeg", "png", "gif");
    if (!in_array($imageFileType, $allowedTypes)) {
        echo "Csak JPG, JPEG, PNG és GIF fájlok engedélyezettek.";
        $uploadOk = 0;
    }

    // Ellenőrizzük, hogy a feltöltés sikerült-e
    if ($uploadOk == 0) {
        echo "A fájlt nem sikerült feltölteni.";
    } else {
        if (move_uploaded_file($_FILES["file"]["tmp_name"], $targetFile)) {
            echo "A fájl sikeresen feltöltve: " . htmlspecialchars(basename($_FILES["file"]["name"]));
        } else {
            echo "Hiba történt a feltöltés során.";
        }
    }
}
?>