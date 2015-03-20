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
  <?= js('https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js') ?>
  <?= js('assets/javascript/awm.js', true) ?>
  <? snippet('analytics') ?>
</body>
</html>