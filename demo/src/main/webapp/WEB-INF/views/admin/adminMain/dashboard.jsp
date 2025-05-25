<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="/static/css/style.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>

<div class="dashboard-container">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Admin Dashboard</a>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link" href="/admin/products">Quản lý sản phẩm</a></li>
                    <li class="nav-item"><a class="nav-link" href="/admin/categories">Quản lý danh mục</a></li>
                    <li class="nav-item"><a class="nav-link" href="/admin/orders">Quản lý đơn hàng</a></li>
                    <li class="nav-item"><a class="nav-link" href="/admin/shipments">Quản lý giao hàng</a></li>
                    <li class="nav-item"><a class="nav-link" href="/admin/customers">Quản lý khách hàng</a></li>
                    <li class="nav-item"><a class="nav-link" href="/admin/promotions">Quản lý khuyến mãi</a></li>
                    <li class="nav-item"><a class="nav-link" href="/admin/reports">Thống kê & Báo cáo</a></li>
                </ul>
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link text-danger" href="/admin/logout">Đăng xuất</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="content-container">
        <iframe id="contentFrame" src="/admin/products" frameborder="0"></iframe>
    </div>
</div>

<script>
    $(document).ready(function() {
        $(".nav-link").click(function(event) {
            event.preventDefault();
            const href = $(this).attr("href");
            $("#contentFrame").attr("src", href);
        });
    });
</script>

</body>
</html>
