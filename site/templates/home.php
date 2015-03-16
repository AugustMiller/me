<? snippet('header') ?>

  <main>
    <article>
      <div class="column full">
        <?= $page->text()->kirbytext() ?>
      </div>
    </article>

    <article>
      <div class="column full spacer"></div>
    </article>

    <article>
      <div class="column full">
        <?= $page->recent()->kirbytext() ?>
      </div>
    </article>

    <article>
      <div class="column full spacer"></div>
    </article>

    <article>
      <div class="column full">
        <?= $page->experience()->kirbytext() ?>
      </div>
    </article>

    <article>
      <div class="column full spacer"></div>
    </article>

    <article>
      <div class="column full">
        <?= $page->contact()->kirbytext() ?>
      </div>
    </article>

    <article>
      <div class="column full spacer smiley"></div>
    </article>
  </main>

<? snippet('footer') ?>