<? /* Site Helper Functions */

function body_classes ( $add = [] ) {
  array_push($add, page()->uid() );
  array_push($add, page()->template() );

  return join($add, ' ');
}