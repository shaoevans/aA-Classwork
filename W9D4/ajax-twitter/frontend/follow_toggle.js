const APIUtil = require("./api_util.js");

class FollowToggle {
    constructor($domObj, options) {
        this.$domObj = $domObj;
        this.followState = this.$domObj.attr("data-initial-follow-state") || options.followState;
        this.userId = this.$domObj.attr("data-user-id") || options.userId;
        this.handleClick();
    }

    render() {
        if (this.$domObj.prop("disabled") ) {
            this.$domObj.prop("disabled", false);
        } else {
            this.$domObj.prop("disabled", true);

        }
    }

    handleClick() {
        let that = this;
        if (this.followState === "followed") {
            this.$domObj.html("Unfollow!");
        } else {
            this.$domObj.html("Follow!");
        }
        this.$domObj.on("click", (event) => {
            this.render();
            if (this.followState === "followed") {
                APIUtil.unfollowUser(this.userId).then(this.toggle()).then(setTimeout(this.render.bind(that), 4000));
            } else {
                APIUtil.followUser(this.userId).then(this.toggle()).then(setTimeout(this.render.bind(that), 4000));
            }

        });

        
    }

    toggle() {
        if (this.followState === "followed") {
            this.followState = "unfollowed";
        } else {
            this.followState = "followed";
        }
        if (this.followState === "followed") {
            this.$domObj.html("Unfollow!");
        } else {
            this.$domObj.html("Follow!");
        }
        
    }
}

module.exports = FollowToggle;