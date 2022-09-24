extension ListExtesions<E> on List<E>? {

  List<E> orEmpty() => this ?? List.empty();

}