class HanoiView{
  constructor(game, $domEle){
    this.game = game;
    this.$domEle = $domEle;
    this.setupTowers();
    this.render();
    this.bindEventCaller();
  }

  bindEventCaller() {
    let $towers = $(".tower");
    $towers.each((i, tower) => {
      console.log(tower)
      let $currentTower = $(tower);
      console.log($currentTower)
      this.clickTowers($currentTower);
    })

  }

  clickTowers($domObject) {
    $domObject.on("click", (event) => {
      // console.log($(event.target).first().attr("class"))
      if (this.$firstTower) {
        this.$secondTower = $(event.currentTarget);
        if (!this.game.isValidMove(this.$firstTower.data().index, this.$secondTower.data().index )){
          alert("This is an invalid move");
        } else {
          this.game.move(this.$firstTower.data().index, this.$secondTower.data().index);
          let firstTowerChildren = this.$firstTower.children();
          let secondTowerChildren = this.$secondTower.children();
          for (let i = 2; i >= 0; i--) {
            let $1child = $(firstTowerChildren[i]);
            if ($1child.attr("class")) {
              let classToAdd = $1child.attr("class")
              $1child.removeClass(classToAdd);
              for (let j = 0; j < 3;  j++) {
                let $2child = $(secondTowerChildren[j]);
                if (!$2child.attr("class")) {
                  $2child.addClass(classToAdd);
                  break;
                }
              }
              break;
            }
          }
        };

        if (this.game.isWon()) {
          alert("Good work, you!")
        }
        this.$firstTower = null;
      } else {
        console.log(event.currentTarget)
        this.$firstTower = $(event.currentTarget);

        //light up tower when clicked
      }
      
    })

  }

  setupTowers(){
    for (let i = 0; i < 3; i++){
      let $ul = $('<ul class="tower"></ul>')
      $ul.data("index", i)
      this.$domEle.append($ul);
    }
    let $towers = this.$domEle.children();
    for (let i = 0; i < 3; i++){
      let $tower = $($towers[i]);
      for (let j = 0; j < 3; j++) {
        $tower.append("<li></li>");
      }
    }


  }

  render(){
    let $firstTower = $(this.$domEle.children()[0]);
    console.log($firstTower)
    $firstTower.children().each((i, child) => {
      let $child = $(child);
      console.log($child)
      $child.addClass(`disc-${3-i}`);
    }) 
  }
}


module.exports = HanoiView;