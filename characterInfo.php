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
        $characters=getAll();
        $selectedChar=null;
        $formValue=$_POST["charSelect"];?>

        <h2><?= htmlspecialchars($selectedChar['characterId']) ?></h2>
        <form action="#" method="post" name="selectChar">
            <select name="characterSelect" name="charSelect">
                <option value="">--Please choose a character--</option>
                <?php foreach($characters as $character): ?>
                <option value="(<?= htmlspecialchars($character['characterId'])?>">
                    <?= htmlspecialchars($character['characterId']) ?>
                </option>
                <?php if(isset($formValue)==true && getSelected($character['characterId'])==$formValue){
                    $selectedChar=$character;
                }
                endforeach ?>
            </select>
            <button type="submit">Select</button>
        </form>
        <img src="img/<?= htmlspecialchars($selectedChar['imageURL'])?>" alt="" class="infoPic">
        <h2>Name : <?= htmlspecialchars($selectedChar['firstName'])?> <?=htmlspecialchars($selectedChar['lastName'])?></h2>
        <h2>Gender : <?= htmlspecialchars($selectedChar['gender'])?></h2>
        <h2>Species : <?= htmlspecialchars($selectedChar['name'])?></h2>
        <p><?= htmlspecialchars($selectedChar['description'])?></p>
        <?php var_dump($selectedChar); 
        var_dump($formValue);?>
    </body>
</html>