$("#sendMail").click(function(){
    resetPassword();
  });

$(document).ajaxStart(function(){
    $('#loading').show();
    $('#loadmore').hide();
}).ajaxStop(function(){
    $('#loading').hide();
    $('#loadmore').show();
});

var no = 0

function loadCard() {
    $.ajax({
        type: "GET",
        url: "/home/cards/" + no,
        success: function (response) {
            $("#wallpage").before(response);
            no += 2;
            console.log(no);
        }
    });
}

function resetPassword(){
    $('#info').text('Please Wait....');
    $.ajax({
        url : "/api/user/resetPassword",
        type: "POST",
        data : {'email': $("#emailid").val().trim()},
        success : function(data) {
            console.log(data);
            $('#info').text(data);
        },
        error : function() {
            $('#info').text('error');
        }

    });
}

function loadAndScroll(){
    $("html, body").animate({ scrollTop: $(document).height()}, 1000);
    loadCard();
}
