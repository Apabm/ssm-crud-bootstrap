<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
  Created by IntelliJ IDEA.
  User: 79285
  Date: 2021/11/22
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>员工列表</title>
    <%-- request.getContextPath()：以/开始但没有以/结束--%>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>

    <%--引入jquery--%>
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
          integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"
            integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd"
            crossorigin="anonymous"></script>
</head>
<body>

<div class="container">
    <%--标题--%>
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>


        <%--按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button type="button" class="btn btn-primary">新增</button>
            <button type="button" class="btn btn-danger">删除</button>
        </div>
    </div>


        <%--显示表格数据--%>
    <div class="row"></div>
        <div class="col-md-12">
            <table class="table table-hover">
                <tr>
                    <th>员工ID</th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>邮箱</th>
                    <th>部门</th>
                    <th>操作</th>
                </tr>

                <c:forEach items="${pageInfo.list}" var="emp">
                <tr>
                    <th>${emp.empId}</th>
                    <th>${emp.empName}</th>
                    <th>${emp.gender=="M"?"男":"女"}</th>
                    <th>${emp.email}</th>
                    <th>${emp.department.deptName}</th>
                    <th>
                        <button type="button" class="btn btn-default btn btn-primary btn-sm" aria-label="Left Align">
                            <span class="glyphicon glyphicon-align-left" aria-hidden="true"></span>编辑
                        </button>
                        <button type="button" class="btn btn-default btn-danger btn-sm" aria-label="Left Align">
                            <span class="glyphicon glyphicon-remove " aria-hidden="true"></span>删除
                        </button>
                    </th>
                </tr>
                </c:forEach>
            </table>
        </div>

        <%--显示分页--%>
    <div class="row">
        <div class="col-md-6">
            当前${pageInfo.pageNum}页，总${pageInfo.pages}页
        </div>
        <nav aria-label="Page navigation">
            <ul class="pagination">


                <c:if test="${pageInfo.hasPreviousPage}">
                    <li><a href="${APP_PATH}/emps?pn=1">首页</a></li>
                    <li>
                        <a href="${APP_PATH}/emps?pn=${pageInfo.pageNum}-1" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                </c:if>

                <c:forEach items="${pageInfo.navigatepageNums}" var="page_Num">
                    <c:if test="${pageInfo.pageNum==page_Num}">
                        <li class="active"><a href="${APP_PATH}/emps?pn=${page_Num}">${page_Num}</a></li>
                    </c:if>
                    <c:if test="${pageInfo.pageNum!=page_Num}">
                        <li><a href="${APP_PATH}/emps?pn=${page_Num}">${page_Num}</a></li>
                    </c:if>
                </c:forEach>

                <c:if test="${pageInfo.hasNextPage}">
                    <li>
                        <a href="${APP_PATH}/emps?pn=${pageInfo.pageNum}+1" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                    <li><a href="${APP_PATH}/emps?pn=${pageInfo.pages}">末页</a></li>
                </c:if>

            </ul>
        </nav>
        <div class="col-md-6"></div>
    </div>
</div>

</body>
</html>
