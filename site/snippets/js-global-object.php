<? $location = explode(',', $site->location()); ?>

<script>
  window.AWM = window.AWM || {
    Classes: {},
    Functions: {},
    UI: {},
    Storage: {
      sunrise: <?= get_sunrise() ?>,
      sunset: <?= get_sunset() ?>,
      lat: <?= get_location()['lat'] ?>,
      lng: <?= get_location()['lng'] ?>,
      canvas_unsupported: 'Oh, no! I had something neat planned, but your browser doesn&apos;t support some awesome new technologies.'
    }
  };
</script>