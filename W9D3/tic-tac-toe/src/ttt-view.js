class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard();
    this.bindEvents();

  }


  bindEvents() {
    this.$el.on("click", (event) => {
      let $target = $(event.target);
      this.makeMove($target);
    });
  }


  makeMove($square) {
    let positionValue = $square.data();
    let pos = [positionValue['0'], positionValue['1']];
    if (!this.game.board.isEmptyPos(pos)) {
      alert("Invalid Move! Try Again");
    } else {
      $square.html(this.game.currentPlayer);
      this.game.playMove(pos);
      $square.removeClass("unselected");
      $square.addClass("selected");
      
    }
    if (this.game.isOver()) {
      // let $lis = $(this.$el.children()[0]).children();
      if (this.game.winner() === null){
        $("li").each( (i, listele) => {
          $(listele).addClass("loser");
        });
      } else {
        let winnerMark = this.game.winner();
        $("li").each((i, listele) => {
          console.log(winnerMark)
          if ($(listele).text() === winnerMark) {
            $(listele).addClass("winner");
          } else {
            $(listele).addClass("loser");
          }
          
        });
        // let $allSquares = this.$el.firstChild().children();
      }
    }

  }

  setupBoard() {
    this.$el.append('<ul class="grid"></ul>');
    const $grid = $('.grid');
    for (let i = 0; i < 3; i++){
      for (let j = 0; j < 3; j++) {
        let $li = $('<li class="unselected"></li>')
        $li.data([i,j])
        $grid.append($li);

      }

    }
  }
}

module.exports = View;
