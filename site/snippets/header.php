<!DOCTYPE html>
<html lang="en">
<head>

  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1.0">

  <title><?= $site->title()->html() ?> | <?= $page->title()->html() ?></title>
  <meta name="description" content="<?= $site->description()->html() ?>">
  <meta name="keywords" content="<?= $site->keywords()->html() ?>">

  <?= css('assets/css/awm.css') ?>
  <?#= css('http://fonts.googleapis.com/css?family=Fira+Mono:400,700') ?>
  <?= css('assets/fonts/publico-mono/1502-BJGGWI.css') ?>

</head>
<body class="<?= body_classes(['awm']) ?>">

  <header>
    <article>
      <div class="column full">
        <h1>August Winfield Miller</h1>
      </div>
    </article>
  </header>