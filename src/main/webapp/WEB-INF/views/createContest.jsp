<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@page isELIgnored = "false" %>
        <html>

        <head>
        </head>

        <body>
            <!-- header -->
            <jsp:include page="/WEB-INF/shared/header.jsp" />
            <script src="<c:url value=" /resources/script/moment.js " />"></script>
            <script src="<c:url value=" /resources/script/bootstrap-datetimepicker.js " />"></script>
            <link rel='stylesheet' href="<c:url value=" /resources/css/bootstrap-datetimepicker.css "/>" type='text/css' media='screen'/>
            <link rel='stylesheet' href="<c:url value=" /resources/css/jsgrid.min.css "/>" type='text/css' media='screen' />
            <link rel='stylesheet' href="<c:url value=" /resources/css/jsgrid-theme.css "/>" type='text/css' media='screen' />
            <script src="<c:url value=" /resources/script/jsgrid.js " />"></script>
            <script type="text/javascript">
                $(function () {
                    $('#starttimepicker').datetimepicker();
                    $('#endtimepicker').datetimepicker();
                });
            </script>
            <div class="container">
                <div class="row">
                    <h3>Create Contest</h3>
                    <p>Host your own contest on CodeTheory.</p>
                </div>

                <div class="form-group col-lg-12">
                    <label>Contest Name
                        <label>
                            <input placeholder="Contest Name" class="form-control" required="true" />
                            <div id="uname_response" class="response"></div>
                </div>
                <div class='col-sm-12'>
                    <div class="form-group">
                        <label>Starting
                            <label>
                                <div class='input-group date' id='starttimepicker'>
                                    <input type='text' class="form-control" />
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                                </div>
                    </div>
                </div>
                <div class='col-sm-12'>
                    <div class="form-group">
                        <label>Ending
                            <label>
                                <div class='input-group date' id='endtimepicker'>
                                    <input type='text' class="form-control" />
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                                </div>
                    </div>
                </div>

            </div>
            <!-- footer -->
            <jsp:include page="/WEB-INF/shared/footer.jsp" />
        </body>

        </html>