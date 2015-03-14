<? /* Site Helper Functions */

function body_classes ( $add = [] ) {
  array_push($add, page()->uid() );
  array_push($add, page()->template() );

  return join(array_unique($add), ' ');
}

function get_sunrise ( ) {
  $location = get_location();
  return date_sunrise(time(), SUNFUNCS_RET_TIMESTAMP, $location['lat'], $location['lng'], 90, -8) * 1000;
}

function get_sunset ( ) {
  $location = get_location();
  return date_sunset(time(), SUNFUNCS_RET_TIMESTAMP, $location['lat'], $location['lng'], 90, -8) * 1000;
}

function get_location ( ) {
  return [
    'lat' => c::get('location.lat'),
    'lng' => c::get('location.lng')
  ];
}