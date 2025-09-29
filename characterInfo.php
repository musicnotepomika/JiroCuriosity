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

        <h2><?= htmlspecialchars($character['characterId']) ?></h2>
        <form action="#" method="post">
            <select name="characterSelect" id="charSelect">
                <option value="">--Please choose a character--</option>
                <?php foreach($characters as $character): ?>
                <option value="(<?= htmlspecialchars($character['characterId'])?>">
                    <?= htmlspecialchars($character['characterId']) ?>
                </option>
                <?php endforeach ?>
            </select>
            <button type="submit">Select</button>
        </form>
        <img src="img/<?= htmlspecialchars($character['imageURL'])?>" alt="" class="infoPic">
        <h2>Name : <?= htmlspecialchars($character['firstName'])?> <?=htmlspecialchars($character['lastName'])?></h2>
        <h2>Gender : <?= htmlspecialchars($character['gender'])?></h2>
        <h2>Species : <?= htmlspecialchars($character['name'])?></h2>
        <p><?= htmlspecialchars($character['description'])?></p>
    </body>
</html>