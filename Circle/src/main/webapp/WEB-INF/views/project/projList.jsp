<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Circle</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/project/projList.css">

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
</head>
<body>
	<div class="wrap">
		<jsp:include page="../common/menuTopBar.jsp" />
		<jsp:include page="../common/menuAlertBar.jsp" />
		<div class="container">
			<div class="navLeft">
				<jsp:include page="../post/postSidebar.jsp" />
			</div>
			<div class="content">

				<div>
					<jsp:include page="../project/projHomebar.jsp" />
				</div>
				<!-- 내용 -->
   <div class="table-wrapper">
        <div class="table-title">
            <div class="row">
                <div class="col-sm-6"><h2>Project List</h2></div>
                <div class="col-sm-6">
                
                <!-- radio button part  -->
                    <div class="btn-group" data-toggle="buttons">
                        <label class="btn btn-info active">
                            <input type="radio" name="status" value="all" checked="checked"> All
                        </label>
                        <label class="btn btn-success">
                            <input type="radio" name="status" value="to do"> To-Do
                        </label>
                        <label class="btn btn-warning">
                            <input type="radio" name="status" value="doing"> Doing
                        </label>
                        <label class="btn btn-danger">
                            <input type="radio" name="status" value="done"> Done
                        </label>       
                    </div>
                </div>
            </div>
        </div>
        
        <!-- table part -->
        <table class="table table-striped table-hover">
            <thead>
                <tr>
                    <th>project</th>
                    <th>issue</th>
                    <th>writer</th>
                    <th>progress</th>
                    <th>situration</th>
                    <th>Detail</th>
                </tr>
            </thead>
            <c:forEach  var="projList" items="${projList}">
            <tbody>
                <tr data-status="active" class="item">
                    <td>${projList.pro_code}</td>
                    <td>${projList.iss_title}</td>
                    <td>${projList.emp_info_name}</td>
                    <td><span class="label label-success">${projList.prog_title}</span></td>
                    <td>${projList.situ_title}</td>
                    <td><a href="#" class="btn btn-sm manage">Detail</a></td>
                </tr>
              
               
            </tbody>
                </c:forEach>
        </table>
    </div> 
				</div>
				</div>
				</div>
				
				
				
<script> 
$(document).ready(function()
{
    $(".btn-group .btn").click(function()
    {
        var inputValue  =   $(this).find("input").val();
        if(inputValue   != 'all')
        {
            var target  =   $('table tr[data-status="' + inputValue + '"]');
            $("table tbody tr").not(target).hide();
            target.fadeIn();
        }
        else
        {
            $("table tbody tr").fadeIn();
        } 
    });
    
    
    // Changeing the class of status label to support bootstrap 4
    var bs  =  $.fn.tooltip.Constructor.VERSION;
    var support =   bs.split(".");
    if(str[0]   ==  4)
    {
        $(".label").each(function()
        {
            var classStr    =   $(this).attr("class");
            var newClassStr =   classStr.replace(/label/g, "badge");
            $(this).removeAttr("class").addClass(newClassStr);
        });
    }
});  
</script>
</body>
</html>