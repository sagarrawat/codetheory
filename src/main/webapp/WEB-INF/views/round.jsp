<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored = "false" %>

<script src="<c:url value=" /resources/script/moment.js " />"></script>
<script src="<c:url value=" /resources/script/bootstrap-datetimepicker.js " />"></script>
<link rel='stylesheet' href="<c:url value=" /resources/css/bootstrap-datetimepicker.css "/>" type='text/css' media='screen'/>

<script type="text/javascript">
    $(function () {
        $('#roundstarttimepicker').datetimepicker({
           // format : "YYYY-MM-DD HH:mm:ss"
           minDate:new Date()
        });
        $('#roundendtimepicker').datetimepicker({
           // format : "YYYY-MM-DD HH:mm:ss"
        });
        $(".clickable-row").click(function(){
            window.location = $(this).data("href");
        });
        $("#roundstarttimepicker").on("dp.change", function (e) {
            $('#roundendtimepicker').data("DateTimePicker").minDate(e.date);
        });
    });
</script>


<body> 
    <script type="text/javascript">
        var chlng="${cname}";    
    </script>
    <script src="<c:url value=" /resources/script/roundmgmt.js" />"></script>

    <div class="container">
<div class="row">
        <div class="col-md-6">
        <h3>Rounds &nbsp;&nbsp;
            <a href="#" id="addRound" class="glyphicon glyphicon-plus-sign"></a> | 
            <a href="#" onclick="deleteRound()" id="deleteRound" class="glyphicon glyphicon-trash"></a>
        </h3>
    </div>
    <div class="col-md-6">
        <div class="h3 btn-group pull-right" role="group">           
            <a href="#" id="addChlngBtn" class="btn btn-success">Add Challenges</a>
            <a href="#" class="btn btn-danger" onclick="removeChallengeFromRound()">Remove Selected</a>
        </div>
    </div>
</div>
<div class="row">
        <div class="col-md-3">
            <div class="list-group">
                    <c:forEach items="${rounds}" var="round">
                        <a href="#" id="${round.roundId}" data-type="${round.type}" onclick="changeRound(this)" class="list-group-item">${round.name}</a>
                    </c:forEach>  
                </div>
        </div>
  
        <div class="col-md-9 cardview">
            <div class="table-responsive">
                    <table id="grid" class="table table-bordered table-hover">
                      <thead>
                        <tr>
                          <th>id</th>
                          <th>Question</th>
                          <th>Level</th>
                        </tr>
                      </thead>
                    </table>
                  </div>
        </div>
    </div>
    </div>
</body>


<!-- Add Round Dialog -->
<form id="addRoundDialog" class="modal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">Add Round</h4>
            </div>
            <input type="hidden" value="-1" id="roundId"/>
            <div class="input-group">
                <span class="input-group-addon">Name</span>
                <input id="roundName" type="text" placeholder="Round Name" class="form-control" required/>
            </div>
            <div class="input-group">
                <span class="input-group-addon">Type</span>
                <select id="roundType" class="form-control" required>
                    <option value="0">MCQ</option>
                    <option value="1">Code</option>
                </select>
            </div>
            
        <c:if test="${timmer}">
            <div class="input-group">
                <span class="input-group-addon">
                    Starting Time
                </span>
                <div class='input-group date' >
                    <input type='text' id='roundstarttimepicker' class="form-control" required/>
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
            </div>
            
            <div class="input-group">
                <span class="input-group-addon">
                    Ending Time
                </span>
                <div class='input-group date' >
                    <input type='text' id='roundendtimepicker' class="form-control" required/>
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
            </div>
        </c:if>
            <div class="input-group">
                <input type="checkbox" class="form-check-input" id="resultCheck">
                <label class="form-check-label text-danger" for="resultCheck">
                    Show the result at the End of this round.
                </label>
            </div>

            <button id="addRoundBtn" type="submit" class="btn btn-block btn-success">Add</button>
        </div>
    </div>
</form>
<!-- end Add Round Dialog -->

<!-- Add Round Dialog -->
<div id="addChlngDialog" class="modal" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">Add Challenges</h4>
                    <select id="mcqselect" class="form-control" onchange="loadGrpQuestions(this)">
                        <option value="" selected disabled hidden>Select a Group</option>
                        <c:forEach items="${groups.mcqGroups}" var="g">
                        <option value="${g.groupId}">${g.name}</option>
                    </c:forEach>
                    </select>
                    <select id="codeselect" class="form-control" style="display:none;" onchange="loadGrpQuestions(this)">
                            <option value="" selected disabled hidden>Select a Group</option>
                            <c:forEach items="${groups.codeGroups}" var="g">
                            <option value="${g.groupId}">${g.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="table">
                        <table id="Qgrid" class="table table-bordered table-hover">
                          <thead>
                            <tr>
                              <th>id</th>
                              <th>Question</th>
                              <th>Level</th>
                            </tr>
                          </thead>
                        </table>
                </div>
                <button class="btn btn-block btn-success" onclick="AddChallengesToRound()">Add</button>
            </div>
        </div>
</div>
<!-- end Add Round Dialog -->