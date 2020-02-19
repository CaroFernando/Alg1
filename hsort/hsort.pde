Heap h;

void setup(){
    h = new Heap();
    
    for(int i = 0; i < 100; i++){
       h.insert((int)random(100));
       h.imp();
    }
    
    while(!h.empty()){
        println(h.top());
        h.pop();
        //h.imp();
    }
    
    println("------");
}
