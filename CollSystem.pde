class CollectableSystem implements Pan {
  ArrayList<Collectable>CollectableList = new ArrayList<Collectable>();

  CollectableSystem() {
  }

  void run(int yChange, Pawn star) {
    this.render();
    this.move(yChange);
    this.interaction(star);
    this.clearing();
  }

  void render() {
    for (Collectable q : CollectableList) {
      q.render();
    }
  }

  void move(int yChange) {
    for (Collectable q : CollectableList) {
      q.move(yChange);
    }
  }

  void addCol(Platform plat) { // randomly adds a item close to the platform
    // generate a random number
    // generate a location based on plat. Place it in accordance with the drawing
    // in a switch case
    // add the specific instance of a coll subclass to the array at the location
    // end

    // nothing: 9 coin:9  Color:1 DJ:2 HJ:3

    //TODO: implement this
   
  }

  void interaction(Pawn star) {
    for (Collectable q : CollectableList) {
      q.collectPower(star);
    }
  }

  void clearing() {
    for (int i = CollectableList.size()-1; i>=0; i--) {
      Collectable c =  CollectableList.get(i);
      if (c.isAlive == false) {
        CollectableList.remove(i);
      }
    }
  }
}
