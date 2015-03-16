<? snippet('header') ?>

  <main>
    <article>
      <div class="column full">
        <h1><?= $page->generic_error_title() ?></h1>
        <?= $page->text()->kirbytext() ?>
      </div>
    </article>

    <article>
      <div class="column full spacer"></div>
    </article>
  </main>
  
<? snippet('footer') ?>