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
        pageContext.setAttribute("APP_PATH", request.getContextPath());
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

<!-- 员工添加的模态框 Modal -->
<div class="modal fade" id="empAndModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">员工信息添加</h4>
            </div>
            <div class="modal-body">
                Copy
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="empName_and_input" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_and_input"
                                   placeholder="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_and_input" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_and_input"
                                   placeholder="email@qq.com">
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_add_input" checked="checked" value="M"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
                            </label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">部门名</label>
                        <div class="col-sm-4">
                            <%--部门提交id--%>
                            <select class="form-control" id="dept_add_select" name="dId">
                            </select>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" id="submit_add_btn" class="btn btn-primary">提交</button>
            </div>
        </div>
    </div>
</div>

<!-- 员工修改的模态框 Modal -->
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">员工信息修改</h4>
            </div>
            <div class="modal-body">

                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="empName_and_input" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empName-static"></p>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_and_input" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_update_input"
                                   placeholder="email@qq.com">
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_update_input" checked="checked" value="M">
                                男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_update_input" value="F"> 女
                            </label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">部门名</label>
                        <div class="col-sm-4">
                            <%--部门提交id--%>
                            <select class="form-control" id="dept_update_select" name="dId">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" id="submit_update_btn" class="btn btn-primary">提交</button>
            </div>
        </div>
    </div>
</div>

<!-- 员工信息查询的模态框 Modal -->
<div class="modal fade" id="searchEmpModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">员工信息</h4>
            </div>
            <div class="modal-body">

                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="empName_and_input" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="search-name-static"></p>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_and_input" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="search-email-static"></p>
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="search-gender-static"></p>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">部门名</label>
                        <div class="col-sm-4">
                            <p class="form-control-static" id="search-dept-static"></p>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>


<div class="container">
    <%--标题--%>
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>


    <%--按钮--%>
    <div class="row">
        <%--查询员工信息--%>

        <div class="col-md-12">
            <input type="text" id="search-id" placeholder="请输入员工号">
            <button id="search-info">查询</button>
        </div>

        <div class="col-md-4 col-md-offset-8">
            <button type="button" id="emp_and_modal_btn" class="btn btn-primary">新增</button>
            <button type="button" class="btn btn-danger" id="emps_delte_btn">删除</button>
        </div>
    </div>


    <%--显示表格数据--%>
    <div class="row"></div>
    <div class="col-md-12">
        <table class="table table-hover" id="emps_table">
            <thead>
            <tr>
                <th><input type="checkbox" id="check-all"></th>
                <th>员工ID</th>
                <th>姓名</th>
                <th>性别</th>
                <th>邮箱</th>
                <th>部门</th>
                <th>操作</th>
            </tr>
            </thead>

            <tbody>

            </tbody>

        </table>
    </div>

    <%--显示分页--%>
    <div class="row">
        <div class="col-md-6" id="page_info_area"></div>
        <div class="col-md-6" id="page_nav_area"></div>
    </div>

    <%--跳转表单--%>
    <div class="row col-lg-offset-7">
        <div>
            <input type="text" id="pageNum" placeholder="例如:1">
            <button id="to-number">跳转</button>
        </div>
    </div>

    <a id="test-1"></a>

</div>

<script type="text/javascript">
    /*最大页数*/
    var toMaxPage;
    /*当前页数*/
    var currentPage;
    /*每页显示员工信息的数量*/
    var pageSize;
    $(function () {
        /* 解决bug*/
        /*window.location.href="?#";*/
        page_to(1);
    });

    /*跳转页数的方法*/
    function page_to(pn) {
        $.ajax({
            url: "${APP_PATH}/emps/" + pn,
            type: "get",
            success: function (result) {
                pageSize = result.map.pageInfo.pageSize;
                build_emps_table(result);
                build_page_info(result);
                build_page_nav(result)

            }
        });
    }


    /*员工信息*/
    function build_emps_table(result) {
        $("#emps_table tbody").empty();
        var emps = result.map.pageInfo.list;
        $.each(emps, function (index, item) {
            var empIdTd = $("<td></td>").append(item.empId);
            var empName = $("<td></td>").append(item.empName);
            var gender = item.gender == 'M' ? "男" : "女";
            var genderId = $("<td></td>").append(gender);
            var email = $("<td></td>").append(item.email);
            var deptName = $("<td></td>").append(item.department.deptName);

            var editButton = $("<button></button>").addClass("btn btn-default btn btn-primary btn-sm btn-update")
                .append($("<span></span>").addClass("glyphicon glyphicon-align-left").append("编辑"));
            editButton.attr("emp_id_btn", item.empId);

            var deleteButtion = $("<button></button>").addClass("btn btn-default btn-danger btn-sm btn-delete").append($("<span></span>")
                .addClass("glyphicon glyphicon-remove").append("删除"));
            deleteButtion.attr("emp_delete_id_btn", item.empId);

            /*为编辑与删除按钮之间添加空隙*/
            var twoButton = $("<td></td>").append(editButton).append(" ").append(deleteButtion)

            /*为每个选项之前添加一个选择框*/
            var checkBox = $("<td></td>").append($("<input type='checkbox' class='check-for-one'></input>"));

            $("<tr></tr>").append(checkBox).append(empIdTd)
                .append(empName).append(genderId)
                .append(email).append(deptName)
                .append(twoButton)
                .appendTo("#emps_table tbody");
        });
    }

    /*分页信息*/
    function build_page_info(result) {
        $("#page_info_area").empty();
        $("#page_info_area").append("当前第" + result.map.pageInfo.pageNum + "页"
            + "，共" + result.map.pageInfo.pages + "页," + "总" + result.map.pageInfo.total + "条记录");
        toMaxPage = result.map.pageInfo.total;
        currentPage = result.map.pageInfo.pageNum;
    }

    /*分页导航*/
    function build_page_nav(result) {
        $("#page_nav_area").empty();
        var firstLi = $("<li></li>").append($("<a></a>").attr("href", "#").append("首页"));
        var prePageLi = $("<li></li>").append($("<a></a>").attr("href", "#").append($("<span></span>").append("&laquo;")));
        var lastLi = $("<li></li>").append($("<a></a>").attr("href", "#").append("末页"));
        var nextPageLi = $("<li></li>").append($("<a></a>").attr("href", "#").append($("<span></span>").append("&raquo;")));

        if (result.map.pageInfo.hasPreviousPage == false) {
            firstLi.addClass("disabled");
            prePageLi.addClass("disabled");
        } else {
            firstLi.click(function () {
                page_to(1);
            });
            prePageLi.click(function () {
                page_to(result.map.pageInfo.pageNum - 1);
            });
        }

        var ul = $("<ul></ul>").addClass("pagination").append(firstLi).append(prePageLi);

        $.each(result.map.pageInfo.navigatepageNums, function (index, item) {

            var everyLi = $("<li></li>").append($("<a></a>").attr("href", "#").append(item));
            if (result.map.pageInfo.pageNum == item) {
                everyLi.addClass("active");
            }
            everyLi.click(function () {
                page_to(item);
            });

            ul.append(everyLi);
        });


        if (result.map.pageInfo.hasNextPage == false) {
            lastLi.addClass("disabled");
            nextPageLi.addClass("disabled");
        } else {
            lastLi.click(function () {
                page_to(result.map.pageInfo.pages);
            });
            nextPageLi.click(function () {
                page_to(result.map.pageInfo.pageNum + 1);
            });
        }

        ul.append(lastLi).append(nextPageLi);
        var nav = $("<nav></nav>").append(ul);
        nav.appendTo("#page_nav_area");
    }


    /*表单完整的重置*/
    function reset_form(ele) {
        $(ele)[0].reset();

        /*表单样式*/
        $(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
    }

    /*得到部门的方法*/
    function getDept(ele) {

        /*防止重复*/
        $(ele).empty();

        $.ajax({
            url: "${APP_PATH}/depts",
            type: "get",
            success: function (result) {
                $.each(result.map.depts, function () {
                    var dept = $("<option></option>").append(this.deptName).attr("value", this.deptId);
                    dept.appendTo(ele);
                });
            }
        });
    }

    /*新增按钮弹出框*/
    $("#emp_and_modal_btn").click(function () {
        reset_form("#empAndModal form");

        /*获取所有部门的下拉列表*/
        getDept("#dept_add_select");

        /*弹出模态框*/
        $("#empAndModal").modal({
            backdrop: "static",
        });
    });


    function valid_add_form() {

        /*正则表达式校验用户名*/
        var empName = $("#empName_and_input").val();
        var regName = /(^[a-zA-Z0-9_-]{3,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
        if (!regName.test(empName)) {

            show_validate_msg("#empName_and_input", "error", "用户名可以是3-6位英文或2-5位中文");
            return false;
        } else {
            show_validate_msg("#empName_and_input", "success", "");
        }

        /*正则表达式校验邮箱*/
        var email = $("#email_and_input").val();
        var regEmail = /^([a-zA-Z0-9]+([-_.][a-zA-Z0-9]+)*@[a-zA-Z0-9]+([-_.][a-zA-Z0-9]+)*\.[a-z]{2,}$)/;
        if (!regEmail.test((email))) {
            show_validate_msg("#email_and_input", "error", "邮箱格式不正确，请重新输入！");
            return false;
        } else {
            show_validate_msg("#email_and_input", "success", "");
        }

        return true;

    }


    /*显示检验结果方法*/
    function show_validate_msg(ele, status, msg) {
        $(ele).parent().removeClass("has-error has-success");
        $(ele).next("span").text("");
        if (status == "error") {
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        } else if (status == "success") {
            $(ele).next("span").addClass("has-success");
            $(ele).next("span").text(msg);
        }

    }


    /*提交表单*/
    $("#submit_add_btn").click(function () {

        if ($("#empName_and_input").attr("var_empName") == "error") {
            return false;
        }


        if (!valid_add_form()) {
            return false;
        }


        $.ajax({
            url: "${APP_PATH}/emp",
            data: $("#empAndModal form").serialize(),
            type: "post",
            success: function (result) {

                /*使用JSR校验*/
                if (result.status == 100) {
                    /*关闭模态框*/
                    $("#empAndModal").modal('hide');

                    /*跳转到最后一页*/
                    page_to(toMaxPage);
                } else {
                    if (result.map.va_msg != undefined) {
                        show_validate_msg("#empName_and_input", "error", result.map.va_msg);
                    }
                    if (result.map.errorFields.email != undefined) {
                        show_validate_msg("#email_and_input", "error", result.map.errorFields.email);
                    }
                    if (result.map.errorFields.empName != undefined) {
                        show_validate_msg("#empName_and_input", "error", result.map.errorFields.empName);
                    }

                }

            }
        });
    });

    /*发起ajax请求在后端进行验证*/
    $("#empName_and_input").change(function () {


        var empName = this.value;
        $.ajax({
            url: "${APP_PATH}/checkUser",
            data: "empName=" + empName,
            type: "post",
            success: function (result) {
                if (result.status == 100) {
                    show_validate_msg("#empName_and_input", "success", result.map.va_msg);
                    $("#empName_and_input").attr("var_empName", "success");
                } else if (result.status == 200) {
                    show_validate_msg("#empName_and_input", "error", result.map.va_msg);
                    $("#empName_and_input").attr("var_empName", "error");
                }
            }
        })
    });


    /*为修改按钮绑定单击事件*/
    /*创建之前绑定*/
    $(document).on("click", ".btn-update", function () {


        /*查出部门信息*/
        getDept("#dept_update_select");

        $("#submit_update_btn").attr("edit_id", $(this).attr("emp_id_btn"));

        getEmp($(this).attr("emp_id_btn"));

        $("#empUpdateModal").modal({
            backdrop: "static",
        });
    });

    /*新增功能中:回显用户信息的方法*/
    function getEmp(id) {
        $.ajax({
            url: "${APP_PATH}/emp/" + id,
            type: "get",
            success: function (result) {
                $("#empName-static").text(result.map.employee.empName);
                $("#email_update_input").val(result.map.employee.email);
                $("#empUpdateModal input[name=gender]").val([result.map.employee.gender]);
                $("#empUpdateModal select").val([result.map.employee.dId])
            }
        })
    }

    /*提交功能*/
    $("#submit_update_btn").click(function () {

        /*需要先判断邮箱格式*/
        var email = $("#email_update_input").val();
        var regEmail = /^([a-zA-Z0-9]+([-_.][a-zA-Z0-9]+)*@[a-zA-Z0-9]+([-_.][a-zA-Z0-9]+)*\.[a-z]{2,}$)/;
        if (!regEmail.test((email))) {
            show_validate_msg("#email_update_input", "error", "邮箱格式不正确，请重新输入！");
            return false;
        } else {
            show_validate_msg("#email_update_input", "success", "");
        }
        $.ajax({
            url: "${APP_PATH}/emp/" + $(this).attr("edit_id"),
            data: $("#empUpdateModal form").serialize() + "&_method=put",
            type: "post",
            success: function () {
                /*关闭模态框*/
                $("#empUpdateModal").modal('hide');

                page_to(currentPage);
            }
        });
    });


    /*通过id删除*/
    $(document).on("click", ".btn-delete", function () {

        var id = $(this).attr("emp_delete_id_btn");

        if (confirm("是否要删除【" + $(this).parents("tr").find("td:eq(2)").text() + "】吗")) {
            $.ajax({
                url: "${APP_PATH}/emp/" + id,
                data: "_method=delete",
                type: "post",
                success: function () {
                    page_to(currentPage);
                }
            })
        }
        ;
    });

    /*全选单击事件*/
    $("#check-all").click(function () {
        if ($("#check-all").prop("checked") == true) {
            $(".check-for-one").prop("checked", true);
        } else {
            $(".check-for-one").prop("checked", false);
        }
    });

    /*逐个点击达到当前页面大小,全选选中,否则不选择*/
    $(document).on("click", ".check-for-one", function () {
        if ($(".check-for-one:checked").length == pageSize) {
            $("#check-all").prop("checked", true);
        } else {
            $("#check-all").prop("checked", false);
        }
    });

    /*批量删除*/
    $("#emps_delte_btn").click(function () {
        if ($(".check-for-one:checked").length == 0) {
            return;
        }

        var list_name = "";
        var list_id = "";
        $.each($(".check-for-one:checked"), function () {
            list_name += $(this).parents("tr").find("td:eq(2)").text() + ",";
            list_id += $(this).parents("tr").find("td:eq(1)").text() + "-";
        });

        /*去掉尾部多余的符号*/
        list_name = list_name.substring(0, list_name.length - 1);
        list_id = list_id.substring(0, list_id.length - 1);

        if (confirm("确实要删除【" + list_name + "】吗")) {
            $.ajax({
                url: "${APP_PATH}/emp/" + list_id,
                data: "_method=delete",
                type: "post",
                success: function () {
                    page_to(currentPage);
                }
            });
        }
    });

    /*输入跳转页*/
    $(document).on("click", "#to-number", function () {
        page_to($("#pageNum").val());

    });

    /*查询员工信息*/
    /*$("#search-info").click(function ()*/
    $(document).on("click", "#search-info", function () {
        $.ajax({
            url: "${APP_PATH}/emp/" + $("#search-id").val(),
            type: "get",
            success: function (result) {
                if (result.map.employee == undefined) {
                    alert("该员工可能离职或尚未录入");
                    return false;
                }
                $("#search-name-static").text(result.map.employee.empName);
                $("#search-email-static").text(result.map.employee.email);

                var sex = result.map.employee.gender == 'M' ? '男' : '女';

                $("#search-gender-static").text(sex);


                /*查询部门信息*/
                $.ajax({
                    url: "${APP_PATH}/depts/" + result.map.employee.dId,
                    type: "get",
                    success: function (result) {
                        $("#search-dept-static").text(result.map.dept.deptName);
                    }
                });

                /*跳出模态框*/
                $("#searchEmpModal").modal({
                    backdrop: "static",
                });
                $("#emp-info-form")[0].reset();
            }
        });

    });


</script>

</body>
</html>
