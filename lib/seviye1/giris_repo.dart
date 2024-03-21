class GirisRepo {
  int arttir(int sayac) {
    return sayac + 1;
  }

  int azalt(int sayac) {
    if (sayac <= 0) {
      sayac = 0;
      return sayac;
    } else {
      return sayac - 1;
    }
  }
}
