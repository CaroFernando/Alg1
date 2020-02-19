class Heap {
  int arr[];
  int ind;

  void swap(int i, int j) {
    int temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;
  }

  public Heap(int tam) {
    arr = new int[tam+1];
    this.ind = 1;
  }

  public Heap() {
    arr = new int[10000];
    this.ind = 1;
  }

  void _ins(int i) {
    if (i == 1) return;

    if (arr[i/2] < arr[i]) {
      swap(i/2, i);
      _ins(i/2);
    }
  }

  void insert(int el) {
    arr[ind] = el;
    _ins(ind++);
  }

  int top() {
    return arr[1];
  }

  void down(int i) {
    int l = i*2;
    int r = i*2+1;
    int lar = i;

    if (l <= ind && arr[l] > arr[lar]) lar = l;
    if (r <= ind && arr[r] > arr[lar]) lar = r;

    if (lar != i) {
      swap(i, lar);
      down(lar);
    }
  }

  void pop() {
    swap(1, ind--);
    down(1);
  }

  boolean empty() {
    return ind==1;
  }

  void imp() {
    for (int i = 1; i < ind; i++) {
      print(arr[i]+" ");
    }
    println();
  }
}
