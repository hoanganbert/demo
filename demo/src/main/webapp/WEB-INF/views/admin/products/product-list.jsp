<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Quản lý sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/css/style.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .navigation {
            background-color: #343a40;
            padding: 15px;
        }
        .navigation .nav-item {
            color: #fff;
            margin-right: 20px;
            text-decoration: none;
        }
        .navigation .nav-item:hover, .navigation .logout:hover {
            text-decoration: underline;
        }
        .navigation .logout {
            color: #ffc107;
        }
        .product-img {
            width: 50px;
            height: auto;
        }
        .table-responsive {
            max-height: 600px;
            overflow-y: auto;
        }
    </style>
</head>
<body>

<!-- Navigation -->
<div class="navigation d-flex flex-wrap align-items-center">
    <a href="/admin/products" class="nav-item">🛍 Quản lý sản phẩm</a>
    <a href="/admin/categories" class="nav-item">📂 Quản lý danh mục</a>
    <a href="/admin/orders" class="nav-item">📦 Quản lý đơn hàng</a>
    <a href="/admin/shipments" class="nav-item">🚚 Quản lý giao hàng</a>
    <a href="/admin/customers" class="nav-item">👥 Quản lý khách hàng</a>
    <a href="/admin/promotions" class="nav-item">🎁 Quản lý khuyến mãi</a>
    <a href="/admin/reports" class="nav-item">📊 Thống kê & Báo cáo</a>
    <a href="/admin/logout" class="nav-item logout ms-auto">🔓 Đăng xuất</a>
</div>

<!-- Main Section -->
<section class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h2 class="fw-bold">📋 Danh sách sản phẩm</h2>
        <a href="/admin/products/add" class="btn btn-success">+ Thêm sản phẩm</a>
    </div>

    <!-- Search Bar -->
    <form method="GET" action="/admin/products" class="mb-3">
        <div class="input-group">
            <input type="text" name="keyword" placeholder="🔍 Tìm kiếm sản phẩm..." class="form-control" value="${param.keyword}">
            <button type="submit" class="btn btn-outline-secondary">Tìm</button>
        </div>
    </form>

    <!-- Product Table -->
    <div class="table-responsive">
        <table class="table table-bordered table-hover align-middle text-center">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Tên</th>
                    <th>Giá</th>
                    <th>Mô tả</th>
                    <th>Tồn kho</th>
                    <th>Size</th>
                    <th>Màu</th>
                    <th>Danh mục</th>
                    <th>Ảnh</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="product" items="${products}">
                    <tr>
                        <td>${product.id}</td>
                        <td>${product.name}</td>
                        <td><fmt:formatNumber value="${product.price}" type="currency" currencySymbol="₫" /></td>
                        <td class="text-start">${product.description}</td>
                        <td>${product.stockQuantity}</td>
                        <td>${product.size}</td>
                        <td>${product.color}</td>
                        <td>${product.category.name}</td>
                        <td><img src="/images/${product.image}" class="product-img"></td>
                        <td>
                            <a href="/admin/products/edit/${product.id}" class="btn btn-sm btn-primary">Sửa</a>
                            <a href="/admin/products/delete/${product.id}" class="btn btn-sm btn-danger" onclick="return confirm('Bạn chắc chắn muốn xóa sản phẩm này?')">Xóa</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Pagination -->
    <div class="d-flex justify-content-between align-items-center mt-3">
        <!-- Go to Page Form -->
        <form method="GET" action="/admin/products" class="d-flex">
            <input type="number" name="page" min="1" max="${page.totalPages}" class="form-control me-2" placeholder="Nhập trang...">
            <input type="hidden" name="keyword" value="${param.keyword}" />
            <button type="submit" class="btn btn-primary">Đi đến</button>
        </form>

        <!-- Page Numbers -->
        <ul class="pagination mb-0">
            <c:if test="${page.hasPrevious()}">
                <li class="page-item">
                    <a class="page-link" href="?page=${page.number - 1}&keyword=${param.keyword}">«</a>
                </li>
            </c:if>

            <c:forEach var="i" begin="0" end="${page.totalPages - 1}">
                <c:if test="${i < 3 || i == page.totalPages - 1 || (i >= page.number - 1 && i <= page.number + 1)}">
                    <li class="page-item ${i == page.number ? 'active' : ''}">
                        <a class="page-link" href="?page=${i}&keyword=${param.keyword}">${i + 1}</a>
                    </li>
                </c:if>
                <c:if test="${i == 3 && page.number > 4}">
                    <li class="page-item disabled"><span class="page-link">...</span></li>
                </c:if>
            </c:forEach>

            <c:if test="${page.hasNext()}">
                <li class="page-item">
                    <a class="page-link" href="?page=${page.number + 1}&keyword=${param.keyword}">»</a>
                </li>
            </c:if>
        </ul>
    </div>

</section>

</body>
</html>
