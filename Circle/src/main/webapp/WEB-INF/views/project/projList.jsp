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
					<jsp:include page="../post/postHomebar.jsp" />
				</div>
				<!-- 내용 -->
   <div class="table-wrapper">
        <div class="table-title">
            <div class="row">
                <div class="col-sm-6"><h2>Project List</h2></div>
                <div class="col-sm-6">
                    <div class="btn-group" data-toggle="buttons">
                        <label class="btn btn-info active">
                            <input type="radio" name="status" value="all" checked="checked"> All
                        </label>
                        <label class="btn btn-success">
                            <input type="radio" name="status" value="active"> Active
                        </label>
                        <label class="btn btn-warning">
                            <input type="radio" name="status" value="inactive"> Inactive
                        </label>
                        <label class="btn btn-danger">
                            <input type="radio" name="status" value="expired"> Expired
                        </label>       
                    </div>
                </div>
            </div>
        </div>
        <table class="table table-striped table-hover">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>issue</th>
                    <th>issue date</th>
                    <th>progress</th>
                    <th>writer</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <tr data-status="active">
                    <td>1</td>
                    <td><a href="soengsouy.com">soengsouy.com</a></td>
                    <td>04/10/2019</td>
                    <td><span class="label label-success">Active</span></td>
                    <td>Khmer</td>
                    <td><a href="soengsouy.com" class="btn btn-sm manage">Manage</a></td>
                </tr>
                <tr data-status="inactive">
                    <td>2</td>
                    <td><a href="soengsouy.com">soengsouy.net</a></td>
                    <td>05/08/2018</td>
                    <td><span class="label label-warning">Inactive</span></td>
                    <td>Pursat</td>
                    <td><a href="#" class="btn btn-sm manage">Manage</a></td>
                </tr>
                <tr data-status="active">
                    <td>3</td>
                    <td><a href="soengsouy.com">webdesign.com</a></td>
                    <td>11/05/2020</td>
                    <td><span class="label label-success">Active</span></td>
                    <td>United Kingdom</td>
                    <td><a href="#" class="btn btn-sm manage">Manage</a></td>
                </tr>
                <tr data-status="expired">
                    <td>4</td>
                    <td><a href="soengsouy.com">soengsouy.org</a></td>
                    <td>06/09/2019</td>
                    <td><span class="label label-danger">Expired</span></td>
                    <td>USA</td>
                    <td><a href="#" class="btn btn-sm manage">Manage</a></td>
                </tr>
                <tr data-status="inactive">
                    <td>5</td>
                    <td><a href="soengsouy.com">khmer.com</a></td>
                    <td>12/08/2020</td>
                    <td><span class="label label-warning">Inactive</span></td>
                    <td>Cambodai</td>
                    <td><a href="#" class="btn btn-sm manage">Manage</a></td>
                </tr>
            </tbody>
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