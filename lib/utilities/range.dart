class Range {
  final int first;
  final int second;

  Range(this.first, this.second);

  bool isInRange(int n) {
    return first <= n && n <= second;
  }
}