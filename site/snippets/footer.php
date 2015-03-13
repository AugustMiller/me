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
  <?= js('assets/javascript/awm.js') ?>
</body>
</html>