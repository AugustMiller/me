    <footer>
      <article>
        <div class="column full">
          <?= $site->footer()->kirbytext() ?>
        </div>
      </article>
      <article>
        <div class="column full small">
          <?= $site->colophon()->kirbytext() ?>
        </div>
      </article>
    </footer>
    <aside class="canvas-frame"></aside>

    <?= js([
      'assets/js/app.js'
    ]) ?>

    <? snippet('analytics') ?>
  </body>
</html>
