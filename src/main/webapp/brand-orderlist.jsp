<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: orz10
  Date: 2018/10/9
  Time: 10:40
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
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bootstrap-responsive.min.css">
    <link rel="stylesheet" href="/css/font-awesome.min.css">
    <link rel="stylesheet" href="/css/ace.min.css">
    <link rel="stylesheet" href="/css/ace-skins.min.css">
    <link rel="stylesheet" href="/css/ace-responsive.min.css">
    <script src="js/jquery-1.9.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootbox.min.js"></script>
    <style>
        body, html {
            width: 100%;
            height: 100%;
            background: #fff;
        }

        .info div {
            float: right;
        }

    </style>
</head>

<body>

<div id="main-content" class="clearfix">
    <div id="page-content" class="clearfix">

        <div class="page-header position-relative">
            <h1 style="color: #2679b5;">品牌商
                <small><i class="icon-double-angle-right"></i> 订单管理</small>
            </h1>
        </div>
        <form id="queryForm" class="form-search" action="/BrandOrders/list" method="post">
            商品标题：
            <input type="text" class="input-medium search-query" id="title" name="title">
            <button id="btn_search" class="btn btn-purple btn-small">Search <i
                    class="icon-search icon-on-right"></i></button>
        </form>

        <div class="tabbable">
            <ul class="nav nav-tabs" id="myTab">
                <li class="active"><a data-toggle="tab" href="#ListAll"> 全部</a></li>
                <li class=""><a data-toggle="tab" href="#AwaitingPayment"> 待支付</a></li>
                <li class=""><a data-toggle="tab" href="#AwaitingShipment"> 待发货</a></li>
                <li class=""><a data-toggle="tab" href="#shipped">已发货</a></li>
                <li class=""><a data-toggle="tab" href="#complete">已完成</a></li>
                <li class=""><a data-toggle="tab" href="#canceled">已取消</a></li>
            </ul>
            <div class="tab-content">
                <div id="ListAll" class="tab-pane active">
                    <p>
                    <table id="table_bug_report" class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th class="center">
                                <label><input type="checkbox" class="ace-checkbox-2"><span class="lbl"></span></label>
                            </th>
                            <th>商品标题</th>
                            <th>价格</th>
                            <th class="hidden-480">数量</th>
                            <th>sku</th>
                            <th class="hidden-480">订单编号</th>
                            <th class="hidden-480">状态</th>
                            <th class="hidden-480">订单创建时间</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach items="${brandOrdersList}" var="bo" varStatus="status">
                            <tr>
                                <td class="center">
                                    <label><input type="checkbox" class="input"><span class="lbl"></span></label>
                                </td>
                                <td> ${bo.title }</td>
                                <td>$${bo.price }</td>
                                <td>${bo.quantity }</td>
                                <td>${bo.sku }</td>
                                <td>${bo.orderno }</td>
                                <td><c:choose>
                                    <c:when test="${bo.status==1}">
                                        待支付
                                    </c:when>
                                    <c:when test="${bo.status==2}">
                                        待发货
                                    </c:when>
                                    <c:when test="${bo.status==3}">
                                        已发货
                                    </c:when>
                                    <c:when test="${bo.status==4}">
                                        已完成
                                    </c:when>
                                    <c:when test="${bo.status==5}">
                                        已取消
                                    </c:when>
                                    <c:otherwise>
                                        未知
                                    </c:otherwise>
                                </c:choose></td>
                                <td><fmt:formatDate value="${bo.create_time }" pattern="yyyy/MM/dd-hh:mm:ss"/></td>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                    </p>
                </div>
                <div id="AwaitingPayment" class="tab-pane">
                    <p>
                    <table id="table_bug_report" class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th class="center">
                                <label><input type="checkbox" class="ace-checkbox-2"><span class="lbl"></span></label>
                            </th>
                            <th>商品标题</th>
                            <th>价格</th>
                            <th class="hidden-480">数量</th>
                            <th>sku</th>
                            <th class="hidden-480">订单编号</th>
                            <th class="hidden-480">订单创建时间</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach items="${awaitingPaymentList}" var="bo" varStatus="status">
                            <tr>
                                <td class="center">
                                    <label><input type="checkbox" class="input"><span class="lbl"></span></label>
                                </td>
                                <td> ${bo.title }</td>
                                <td>$${bo.price }</td>
                                <td>${bo.quantity }</td>
                                <td>${bo.sku }</td>
                                <td>${bo.orderno }</td>
                                <td><fmt:formatDate value="${bo.create_time }" pattern="yyyy/MM/dd-hh:mm:ss"/></td>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                    </p>
                </div>
                <div id="AwaitingShipment" class="tab-pane">
                    <p>
                    <table id="table_bug_report" class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th class="center">
                                <label><input type="checkbox" class="ace-checkbox-2"><span class="lbl"></span></label>
                            </th>
                            <th>商品标题</th>
                            <th>价格</th>
                            <th class="hidden-480">数量</th>
                            <th>sku</th>
                            <th class="hidden-480">订单编号</th>
                            <th class="hidden-480">订单创建时间</th>

                            <th>操作</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach items="${awaitingShipmentList}" var="bo" varStatus="status">
                            <tr>
                                <td class="center">
                                    <label><input type="checkbox" class="input"><span class="lbl"></span></label>
                                </td>
                                <td> ${bo.title }</td>
                                <td>$${bo.price }</td>
                                <td>${bo.quantity }</td>
                                <td>${bo.sku }</td>
                                <td>${bo.orderno }</td>
                                <td><fmt:formatDate value="${bo.create_time }" pattern="yyyy/MM/dd-hh:mm:ss"/></td>
                                <td>
                                    <a href="/BrandOrders/shipItem?id=${bo.id}">
                                        <button class="btn btn-minier btn-purple send-out">发货
                                        </button>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    </p>
                </div>
                <div id="shipped" class="tab-pane">
                    <p>
                    <table id="table_bug_report" class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th class="center">
                                <label><input type="checkbox" class="ace-checkbox-2"><span class="lbl"></span></label>
                            </th>
                            <th>商品标题</th>
                            <th>价格</th>
                            <th class="hidden-480">数量</th>
                            <th>sku</th>
                            <th>订单编号</th>
                            <th class="hidden-480">订单创建时间</th>
                            <th class="hidden-480">物流跟踪号</th>
                            <th>操作</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach items="${shippedList}" var="bo" varStatus="status">
                            <tr>
                                <td class="center">
                                    <label><input type="checkbox" class="input"><span class="lbl"></span></label>
                                </td>
                                <td> ${bo.title }</td>
                                <td>$${bo.price }</td>
                                <td>${bo.quantity }</td>
                                <td>${bo.sku }</td>
                                <td>${bo.orderno }</td>
                                <td><fmt:formatDate value="${bo.create_time }" pattern="yyyy/MM/dd-hh:mm:ss"/></td>
                                <td><a href="brand-ordertracking.html">${bo.transportno}</a></td>
                                <td>
                                    <a href="/BrandOrders/cancel?id=${bo.id}">
                                        <button class="btn btn-minier btn-yellow cancel">取消</button>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    </p>
                </div>
                <div id="complete" class="tab-pane">
                    <p>
                    <table id="table_bug_report" class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th class="center">
                                <label><input type="checkbox" class="ace-checkbox-2"><span class="lbl"></span></label>
                            </th>
                            <th>商品标题</th>
                            <th>价格</th>
                            <th class="hidden-480">数量</th>
                            <th>sku</th>
                            <th>订单编号</th>
                            <th class="hidden-480">订单创建时间</th>
                            <th class="hidden-480">物流跟踪号</th>

                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach items="${completeList}" var="bo" varStatus="status">
                            <tr>
                                <td class="center">
                                    <label><input type="checkbox" class="input"><span class="lbl"></span></label>
                                </td>
                                <td> ${bo.title }</td>
                                <td>$${bo.price }</td>
                                <td>${bo.quantity }</td>
                                <td>${bo.sku }</td>
                                <td>${bo.orderno }</td>
                                <td><fmt:formatDate value="${bo.create_time }" pattern="yyyy/MM/dd-hh:mm:ss"/></td>
                                <td><a href="brand-ordertracking.html">${bo.transportno}</a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    </p>
                </div>
                <div id="canceled" class="tab-pane">
                    <p>
                    <table id="table_bug_report" class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th class="center">
                                <label><input type="checkbox" class="ace-checkbox-2"><span class="lbl"></span></label>
                            </th>
                            <th>商品标题</th>
                            <th>价格</th>
                            <th class="hidden-480">数量</th>
                            <th>sku</th>
                            <th>订单编号</th>
                            <th class="hidden-480">订单创建时间</th>

                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach items="${canceledList}" var="bo" varStatus="status">
                            <tr>
                                <td class="center">
                                    <label><input type="checkbox" class="input"><span class="lbl"></span></label>
                                </td>
                                <td> ${bo.title }</td>
                                <td>$${bo.price }</td>
                                <td>${bo.quantity }</td>
                                <td>${bo.sku }</td>
                                <td>${bo.orderno }</td>
                                <td><fmt:formatDate value="${bo.create_time }" pattern="yyyy/MM/dd-hh:mm:ss"/></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>


<script>

    $(function () {

        $('.ace-checkbox-2').each(function () {
            $('.ace-checkbox-2').change(function () {
                if ($(this).prop('checked')) {
                    $(this).parents('.tab-pane').find('.input').prop('checked', true);
                } else {
                    $(this).parents('.tab-pane').find('.input').prop('checked', false);
                }
            })

        })

        $('.send-out').click(function () {
            bootbox.alert("已发货!");
        })
        $('.cancel').click(function () {
            bootbox.alert("订单已取消!");
        })

    })
</script>
<script>
    $("#btn_search").click(function () {
        $("#queryForm").submit();
    });
</script>
</body>
</html>
