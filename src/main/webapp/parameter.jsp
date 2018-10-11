<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: orz10
  Date: 2018/10/11
  Time: 19:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="css/bootstrap.css">
    <%--<link rel="stylesheet" href="css/bootstrap.min.css">--%>
    <link rel="stylesheet" href="css/bootstrap-responsive.min.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/ace.min.css">
    <link rel="stylesheet" href="css/ace-skins.min.css">
    <link rel="stylesheet" href="css/ace-responsive.min.css">
    <script src="js/jquery-1.9.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootstrap-paginator.js"></script>
    <script src="js/bootbox.min.js"></script>
    <style>
        body, html {
            width: 100%;
            height: 100%;
            background: #fff;
        }
    </style>
</head>

<body>
<div id="main-content" class="clearfix">
    <div id="page-content" class="clearfix">

        <div class="page-header position-relative">
            <h1 style="color: #2679b5;">参数管理</h1>
        </div>
        <table id="table_bug_report" class="table table-striped table-bordered table-hover">
            <thead>
            <tr>
                <th class="center">
                    <label><input type="checkbox" class="ace-checkbox-2"><span class="lbl"></span></label>
                </th>
                <th>参数主键</th>
                <th>参数值</th>
                <th>参数说明</th>
                <th>操作</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach items="${pageInfo.list}" var="parameter" varStatus="status">
                <tr>
                    <td class="center">
                        <label><input type="checkbox" class="input"><span class="lbl"></span></label>
                    </td>
                    <td>${parameter.value_id}</td>
                    <td>${parameter.value}</td>
                    <td>${parameter.describe}</td>
                    <td>
                        <div class="inline position-relative">
                            <button id="btn_edit"
                                    onclick="showInModal('${parameter.id}','${parameter.value_id}','${parameter.value}','${parameter.describe}')"
                                    class="btn btn-mini btn-info" data-toggle="modal" data-target="#myModal">
                                <i class="icon-edit"></i></button>
                            <a href="/Parameter/delete?id=${parameter.id}">
                                <button class="btn btn-mini btn-danger"><i class="icon-trash"></i></button>
                            </a>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <button class="btn btn-primary" data-toggle="modal" data-target="#myModal">新增</button>

        <%--分页--%>
        <span>共${pageInfo.total}条结果</span>
        <br>
        <nav aria-label="Page navigation" class="in">
            <ul class="pagination">
                <li>
                    <a href="javascript:go(${pageInfo.prePage})" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <c:forEach items="${pageInfo.navigatepageNums}" var="nav">
                    <c:if test="${nav == pageInfo.pageNum}">
                        <li><a href="javascript:go(${pageInfo.pageNum})"><span style="color: black">${nav}</span></a>
                        </li>
                    </c:if>
                    <c:if test="${nav != pageInfo.pageNum}">
                        <li><a href="javascript:go(${nav})">${nav}</a></li>
                    </c:if>
                </c:forEach>
                <li>
                    <a href="javascript:go(${pageInfo.nextPage})" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </nav>

        <%--把页码放到form里并提交--%>
        <form style="display: none" id="form_query" action="/Parameter/list" method="post">
            <input type="hidden" id="page" name="page">
        </form>
        <script>
            function go(page) {
                $("#page").val(page)
                $("#form_query").submit()
            }
        </script>

        <!-- Modal -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">参数信息</h4>
                    </div>
                    <div class="modal-body">
                        <form id="add_update_form" action="/Parameter/addOrUpdate" method="post"
                              class="form-horizontal">
                            <input type="hidden" id="id" name="id">
                            <div class="control-group">
                                <label class="control-label">参数主键</label>
                                <div class="controls">
                                    <input type="text" id="value_id" name="value_id">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">参数值</label>
                                <div class="controls">
                                    <input type="text" id="value" name="value">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">参数描述</label>
                                <div class="controls">
                                    <input type="text" id="describe" name="describe">
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        <button id="btn_save" type="button" class="btn btn-primary" data-dismiss="modal">保存</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(function () {

        $('.ace-checkbox-2').change(function () {
            if ($('.ace-checkbox-2').prop('checked')) {
                $('.input').prop('checked', true);
            } else {
                $('.input').prop('checked', false);
            }
        })

        $('.btn-danger').click(function () {
            bootbox.alert("删除成功！");
        })
    })
</script>
<script>
    function showInModal(id, value_id, value, describe) {
        $("#id").val(id);
        $("#value_id").val(value_id);
        $("#value").val(value);
        $("#describe").val(describe);
    }

    $("#btn_save").click(function () {
        $("#add_update_form").submit();
    })
</script>
</body>
</html>

