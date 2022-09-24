
extension StringExtesions on String? {

    String orEmpty() => this ?? "";

    bool isNullOrEmpty() => this == null || this?.isEmpty == true;

}