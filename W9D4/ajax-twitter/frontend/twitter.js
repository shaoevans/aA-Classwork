const UsersSearch = require('./users_search.js');

const FollowToggle = require("./follow_toggle.js");
$(document).ready(() => {
    let $buttons = $(".follow-toggle");
    let $searchBar = $(".users-search");


    $buttons.each((i, button) => {
        let ft = new FollowToggle($(button));
    })

    let search = new UsersSearch($searchBar);
})
    