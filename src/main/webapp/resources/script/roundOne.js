var data = '';
var countdownTime;
function loadQuestion(){
    var URL = '/quiz/question/'+contestname+'/'+roundname;
    $.ajax({
            type: "GET",
            url: URL,
            success: function (response) {
                data = response;
                var question_data = '';
                for ( i=0;i<response.length;i++){
                    question_data += '<a hre="#" onclick="getQuestion(id)" id="'+(i+1);
                    question_data += '" id="questionList" style="color:black;text-decoration:none;cursor:pointer"><br>';
                    question_data +=  (i+1)+ ' : '+response[i].question +'';   
                    data[i].selected = -1;           
               }                            
                $('#showQuestion').html(question_data);
                $('#roundOneInstruction').hide();
                $('#startRoundOne').hide();
                $('#durationSelect').hide();
                $('#submitRoundOne').show();
                $('#showQuestion').show();
                $('#countdown').show();
                $('#sideSection').show();
                buildOptionSideBar(0);
            }
    });

    
    var time = $('#timeSelect option:selected').val();
    
    if (time == "10 minutes")
        countdownTime = new Date().getTime() + 600000;
    else if (time == "20 minutes") {
        countdownTime = new Date().getTime() + 1200000; 
    } else {
        countdownTime = new Date().getTime() + 1800000;
    }
    
    if (contestname != 'practice')
        countdownTime = end;

    startCountdown (countdownTime);
}

function buildOptionSideBar(index) {
    if(index < 0) return;
    var option = '';
    option += '<div class="">';
    //replace newline \n \r to html <br>
    option += '<h3>' + data[index].question.replace(/(?:\r\n|\r|\n)/g, '<br>') + '</h3>';
    // <!--Radio group-->
    
    for (j = 0; j < 4; j++) {
        option += '<div class=" form-group cardView">';
        if (data[index].selected == j)
            option += '<input name="op" type="radio" class="with-gap" onclick="changeColor('+(index+1)+','+j+')" checked>';
        else
            option += '<input name="op" type="radio" class="with-gap" id="a'+ j +'" onclick="changeColor('+(index+1)+','+j+')">';
        option += '<label for="a' + j + '">' + data[index].options[j] + '</label>';
        option += '</div>';
    }
    option += '</div>';
    option +='<nav><ul class="pager">';

    var p = index;
    if(index==0)
        p = -2;
    option += '<li class="previous"  onclick="buildOptionSideBar('+ (p-1) +')" id="prev"><a href="#">Previous</a></li>';
    p = index;
    if(index == data.length - 1)
        p = -2;
    option += '<li class="next" onclick="buildOptionSideBar('+ (p+1) +')" id="prev"><a href="#" >Next</a></li>';
    option += '</ul></nav>';

    document.getElementById('sideSection').innerHTML = option;
}

function getQuestion(quesId) {
    var index = quesId-1;
    buildOptionSideBar(index);
 }

 
function showPreview() {  
    var modal = '';
    var count=0;
    for (i = 0; i < data.length; i++) {
        var j = i+1;
        count++;
        if(count==11){
            count = 1;
            modal += '<br/><br/>';
        }
        modal += '<span class="label lb-lg ';
        if(data[i].selected > -1){
          modal += 'label-success" ';
        }
        else {
            modal += 'label-default" ';
        }
        modal += 'onclick="getQuestion('+j+')">';
        modal += j +'</span>';
        document.getElementById('previewbody').innerHTML = modal;
    }
    $("#previewModal").modal("toggle");
}

function changeColor (i , j){
    var change = document.getElementById (i);
    change.style.color = "green";
    data[i-1].selected = j;
}

/*
    submitQuestion 
 */


function submitQuestion(){
    
    //showDialog();
    console.log (roundname);
    var URL = '/'+contestname+'/'+roundname+'/submit';
    $.ajax({
            type: "POST",
            url: URL,
            data: JSON.stringify(data),
            contentType: "application/json",
            success: function(response){
                    if (response == '')
                        location.reload(true);
                    else {
                        $('#roundone').hide();
                        $('#resultArea').html(response);
                    }
            }
    });
}

function startCountdown () {
    
    var time = countdown(countdownTime);
    if (time.value > 0) {
        submitQuestion();
        return;
    }
    document.getElementById ('countdown').innerHTML = time;
    countdownTime -= 1;
    setTimeout (startCountdown, 1000);
}