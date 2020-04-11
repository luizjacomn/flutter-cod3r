extension on Iterable {
  Iterable<T> filter<T>(bool Function(T) predicate) {
    List<T> filtered = [];
    for (T t in this) {
      if (predicate(t)) {
        filtered.add(t);
      }
    }
    
    return filtered;
  }
}

void main() {
  var notas = [5.8, 9.8, 2.5,7.5];
  var notasAcimaDe7 = notas.filter((nota) => nota >= 7.0);
  
  print(notas);
  print(notasAcimaDe7);
}
