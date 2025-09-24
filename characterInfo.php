<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Character information</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <?php include("header.php");
        require("characters.php");
        $characters=getAll();?>

        <h2><?php htmlspecialchars($characters['characterId']) ?></h2>
        <form action="#" method="post">
            <select name="characterSelect" id="charSelect">
                <option value="">--Please choose a character--</option>
                <?php foreach($characters as $character): ?>
                <option value="<?php htmlspecialchars($character['characterId'])?>">
                    <?php htmlspecialchars($character['characterId']) ?>
                </option>
                <?php endforeach ?>
            </select>
            <button type="submit">Select</button>
        </form>
        <img src="img/<?php htmlspecialchars($character['imageURL'])?>" alt="" class="infoPic">
        <h2>Name : <?php htmlspecialchars($character['firstName'])?> <?php htmlspecialchars($character['lastName']) ?></h2>
        <h2>Gender : <?php htmlspecialchars($character['gender'])?></h2>
        <h2>Species : <?php htmlspecialchars($character['name'])?></h2>
        <p><?php htmlspecialchars($character['description'])?></p>
    </body>
</html>