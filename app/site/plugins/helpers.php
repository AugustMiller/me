<? class AWM {
  public static function body_classes ($add = []) {
    $defaults = [
      page()->uid(),
      page()->template(),
      page()->intendedTemplate()
    ];

    return join(array_unique(array_merge($defaults, $add)), ' ');
  }

  public static function get_sunrise () {
    $location = static::get_location();
    return date_sunrise(time(), SUNFUNCS_RET_TIMESTAMP, $location['lat'], $location['lng'], 90, -8) * 1000;
  }

  public static function get_sunset () {
    $location = static::get_location();
    return date_sunset(time(), SUNFUNCS_RET_TIMESTAMP, $location['lat'], $location['lng'], 90, -8) * 1000;
  }

  public static function get_location () {
    return [
      'lat' => c::get('location.lat'),
      'lng' => c::get('location.lng')
    ];
  }
}
