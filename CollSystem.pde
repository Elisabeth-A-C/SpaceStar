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

    PVector centerPlatform = plat.pos;

    int swi = floor(random(24));

    switch(swi) {
    case 8:
      CollectableList.add(new Coin(centerPlatform));
      break;
    case 9:
      CollectableList.add(new Coin(centerPlatform));
      break;      
    case 10:
      CollectableList.add(new Coin(centerPlatform));
      break;      
    case 11:
      CollectableList.add(new Coin(centerPlatform));
      break;      
    case 12:
      CollectableList.add(new Coin(centerPlatform));
      break;
    case 14:
      CollectableList.add(new Coin(centerPlatform));
      break;
    case 15:
      CollectableList.add(new Coin(centerPlatform));
      break;
    case 16:
      CollectableList.add(new Coin(centerPlatform));
      break;
    case 17:
      CollectableList.add(new Changecolor(centerPlatform));
      break;
    case 18:
      CollectableList.add(new Doublejump(centerPlatform));
      break;
    case 19:
      CollectableList.add(new Doublejump(centerPlatform));
      break;
    case 20:
      CollectableList.add(new Higherjump(centerPlatform));
      break;
    case 21:
      CollectableList.add(new Higherjump(centerPlatform));
      break;
    case 22:
      CollectableList.add(new Higherjump(centerPlatform));
      break;
    default:
      break;
    }
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
