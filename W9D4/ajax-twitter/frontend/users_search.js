const APIUtil = require("./api_util.js");
const FollowToggle = require("./follow_toggle.js");

class UsersSearch {
    constructor($domObj){
        this.$domObj = $domObj;
        this.$input = $($domObj.children()[0]);
        this.$ul = $domObj.find(".users")
        console.log(this.$ul[0]);
        this.handleInput();
    }

    handleInput() {
        this.$input.keyup(event => {
            
            APIUtil.searchUsers(this.$input.val()).then((result) => this.renderResults(result));
        });
    }

    renderResults(jsonArr) {
        // console.log(jsonArr);
        this.$ul.empty();
        jsonArr.forEach((res) => {
            // console.log(res);
            let $li = $(`<li>${res.username}</li>`);
            this.$ul.append($li);
            let $button = $('<button class="follow-toggle"></button>');
            let options = {userId: res.id, followState: "followed"};
            $li.append($button);
            let ft = new FollowToggle($button, options);
        });    
    }

    

}

module.exports = UsersSearch;