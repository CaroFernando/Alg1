int arr[];

void merge(int l, int m, int r){
  int temp[] = new int[r-l+1];
  int i, j, k;
  i = l;
  j = m+1;
  k = 0;
  
  while(i <= m && j <= r) {
    if(arr[i] <= arr[j]) {
      temp[k] = arr[i];
      k++; i++;
    }
    else {
      temp[k] = arr[j];
      k++; j++;
    }
  }
  
  while(i <= m) {
    temp[k] = arr[i];
    k++; i++;
  }
 
  while(j <= r) {
    temp[k] = arr[j];
    k++; j++;
  }

  for(int x = l; x <= r; x++) {
    arr[x] = temp[x - l];
  }
  
}

void msort(int l, int r){
  if(l < r){
     msort(l, (l+r)/2);
     msort((l+r)/2 + 1, r);
     merge(l, (l+r)/2, r);
  }
}

void setup(){
   arr = new int[20];
   
   for(int i = 0; i < 20; i++){
     arr[i] = (int) random(100); 
   }
   
   msort(0, 19);
   
   for(int i = 0; i < 20; i++){
     print(arr[i]+" ");
   }
   println();
   
   
}
