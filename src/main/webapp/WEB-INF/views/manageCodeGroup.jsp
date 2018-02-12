<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  <%@page isELIgnored = "false" %>

    <html>

    <head>

    </head>

    <body>
      <!-- header -->
      <jsp:include page="/WEB-INF/shared/header.jsp" />
      <script src="<c:url value=" /resources/script/Codegroupmgmt.js " />"></script>
      <script src="<c:url value=" /resources/lib/datatables/js/jquery.dataTables.js " />"></script>
      <script src="<c:url value=" /resources/lib/datatables/js/dataTables.bootstrap.js " />"></script>
      <link rel='stylesheet' href="<c:url value=" /resources/lib/datatables/css/dataTables.bootstrap.css "/>" type='text/css' media='screen'
      />
      <!-- page body -->
      <div class="container body-content">

        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
          <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="headingOne">
              <h4 class="panel-title">
                <h2 role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-controls="collapseOne">
                  <span class="label label-info">Add Question</span>
                </h2>
                <p>Coding Question Group : ${grpname}</p>
              </h4>
            </div>
            <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
              <div class="panel-body">
                <form id="quesForm" name="qForm" method="POST">
                  <input type="hidden" id="qid" value="-1" />
                  <div>
                    <div class="form-group col-md-12">
                      <div class="input-group">
                        <span class="input-group-addon">
                          Question
                        </span>
                        <input id="codequestion" type="text" placeholder="Your Question goes here" class="form-control" required/>
                      </div>
                    </div>

                    <div class="form-group col-md-12">
                      <div class="input-group">
                        <span class="input-group-addon">
                          Description
                        </span>
                        <textarea id="description" placeholder="Type Description" class="form-control" required></textarea>
                      </div>
                    </div>

                    <div class="form-group col-md-6">
                      <div class="input-group">
                        <span class="input-group-addon">
                          Input
                        </span>
                        <input id="testinput" type="text" placeholder="Test Case Input" class="form-control" required/>
                      </div>
                    </div>

                    <div class="form-group col-md-6">
                      <div class="input-group">
                        <span class="input-group-addon">
                          Output
                        </span>
                        <input id="testoutput" type="text" placeholder="Test Case Output" class="form-control" required/>
                      </div>
                    </div>

                    <div class="form-group col-md-6">
                      <select id="codelvl" class="form-control" required>
                        <option value="1">Easy</option>
                        <option value="2">Medium</option>
                        <option value="3">Hard</option>
                      </select>
                    </div>
                    <div class="form-group col-md-3">
                      <button id="btnsubmit" class="btn btn-primary  btn-block pull-right" onclick="addCodeQuestion()" type="submit">Add</button>
                    </div>
                    <div class="form-group col-md-3">
                      <a class="btn btn-warning  btn-block pull-right" onclick="resetForm()">Reset</a>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
        <div class="table-responsive">
          <table id="grid" class="table table-bordered table-hover">
            <thead>
              <tr>
                <th>Id</th>
                <th>Question</th>
                <th>Details</th>
                <th>Tests</th>
                <th><span class="glyphicon glyphicon-cog"></span></th>                
              </tr>
            </thead>
          </table>
        </div>
        <div>
        </div>
      </div>
      <!-- footer -->
      <jsp:include page="/WEB-INF/shared/footer.jsp" />
    </body>
    </html>