var contest;
var log;
$(function () {
    contest = $('#contestName').val();
    $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
        var target = $(e.target).attr("href").replace('#', '');
        switch (target) {
            case 'Content':
                loadRounds();
                break;
            case 'Moderators':
                loadModerators();
                break;
            case 'Advance':
                break;
        }
    });

    $('#modselect').autocomplete({
        delay: 100,
        minLength: 2,
        source: function (req, res) {
            $.ajax({
                url: '/api/user/suggestion/' + req.term,
                type: 'GET',
                success: function (data) {
                    res(data);
                }
            });
        }
    });
});

function loadRounds() {
    round = null;
    $("#loadingDialog").modal("toggle");
    contest = $('#contestName').val();
    $.ajax({
        type: "GET",
        url: "/contest/"+contest+"/rounds",
        success: function (response) {
            $('#Content').empty();
            $('#Content').html(response);
            $('.modal').modal('hide'); 
            $('body').removeClass('modal-open');
            $('.modal-backdrop').remove();
        }
    });
}

function addModerator() {
    var newmod = $('#modselect').val();
    if (confirm("Are you sure ?\r\n Add " + newmod + "?")) {
        d = { user: newmod, contest: contest, role: 'moderator' };
        $.ajax({
            url: '/api/contest/moderator/',
            contentType: "application/json",
            type: 'POST',
            crossDomain: true,
            data: JSON.stringify(d),
            success: function (response) {
                loadModerators();
            }
        });
    }
}

function removeModerator(moderator) {
    console.log(moderator);
    if (confirm("Are you sure ?\r\n Remove " + moderator + "?")) {
        d = { user: moderator, contest: contest, role: 'moderator' };
        $.ajax({
            url: '/api/contest/editors/' + contest,
            contentType: "application/json",
            crossDomain: true,
            type: 'DELETE',
            data: JSON.stringify(d),
            success: function (response) {
                loadModerators();
            }
        });
    }
}

function loadModerators() {
    $('#modtab').find("tr:gt(0)").remove();
    $('#outloading').show();
    $.ajax({
        type: "GET",
        url: "/api/contest/editors/" + contest,
        success: function (response) {
            var op = '';
            for (i = 0; i < response.length; i++) {
                var user = response[i].user;
                var role = response[i].role;
                op += '<tr><td>';
                op += user;
                op += '</td><td>';
                op += role;
                op += '</td><td>';
                if (response[i].role != 'owner') {
                    op += '<a onClick="removeModerator(\'' + user + '\')">Remove</a>';
                }

                op += '</td></tr>';
            }
            $('#modtab > tbody').last().append(op);
        }
    });
    $('#outloading').hide();
}