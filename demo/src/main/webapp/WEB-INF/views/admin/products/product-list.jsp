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
    <a href="/logout" class="nav-item logout ms-auto">🔓 Đăng xuất</a>
</div>

<!-- Main Section -->
<section class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h2 class="fw-bold">📋 Danh sách sản phẩm</h2>
        <div class="d-flex gap-2">
            <a href="/admin/products/add" class="btn btn-success">+ Thêm sản phẩm</a>
            <!-- ✅ MỚI THÊM: Nút toggle hiển thị form xóa theo danh mục -->
            <button type="button" class="btn btn-outline-danger" onclick="toggleDeleteForm()">🗑 Xóa theo danh mục</button>
        </div>
    </div>

    <!-- Search Form -->
    <form method="GET" action="/admin/products" class="row g-2 mb-3 align-items-center">
        <div class="col-auto">
            <input type="text" name="keyword" placeholder="🔍 Tên sản phẩm..." class="form-control" value="${param.keyword}">
        </div>

        <div class="col-auto">
            <select name="categoryId" class="form-select">
                <option value="">📂 Tất cả danh mục</option>
                <c:forEach var="category" items="${categories}">
                    <option value="${category.id}" ${category.id == selectedCategoryId ? 'selected' : ''}>
                        ${category.name}
                    </option>
                </c:forEach>
            </select>
        </div>

        <div class="col-auto">
            <button type="submit" class="btn btn-primary">Tìm</button>
        </div>
    </form>

    <!-- ✅ MỚI THÊM: Form xóa theo danh mục -->
    <div id="deleteForm" class="row g-2 mb-3 align-items-center d-none">
        <form method="POST" action="/admin/products/delete-by-category" class="row g-2">
            <div class="col-auto">
                <select name="categoryId" class="form-select" required>
                    <option value="">📂 Chọn danh mục để xóa</option>
                    <c:forEach var="category" items="${categories}">
                        <option value="${category.id}">${category.name}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-auto">
                <button type="submit" class="btn btn-danger"
                        onclick="return confirm('Bạn chắc chắn muốn xóa tất cả sản phẩm trong danh mục này?')">Xóa</button>
            </div>
        </form>
    </div>

    <!-- Product table -->
    <div class="table-responsive">
        <table class="table table-bordered table-hover align-middle text-center">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Tên sản phẩm</th>
                    <th>Giá</th>
                    <th>Mô tả</th>
                    <th>Tồn kho</th>
                    <th>Size</th>
                    <th>Màu</th>
                    <th>Danh mục</th>
                    <th>Hình ảnh</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <tbody>
    				<c:forEach var="product" items="${products}" varStatus="loop">
        				<tr>
            			<td>${loop.index + 1}</td> <!-- STT -->
                        <td>${product.name}</td>
                        <td><fmt:formatNumber value="${product.price}" type="currency" currencySymbol="₫" /></td>
                        <td class="text-start">${product.description}</td>

                        <!-- Tồn kho -->
                        <td class="text-start">
                            <ul class="list-unstyled mb-0">
                                <c:forEach var="variant" items="${product.variants}">
                                    <li>${variant.quantity}</li>
                                </c:forEach>
                            </ul>
                        </td>

                        <!-- Size -->
                        <td class="text-start">
                            <ul class="list-unstyled mb-0">
                                <c:forEach var="variant" items="${product.variants}">
                                    <li>${variant.size}</li>
                                </c:forEach>
                            </ul>
                        </td>

                        <!-- Màu -->
                        <td class="text-start">
                            <ul class="list-unstyled mb-0">
                                <c:forEach var="variant" items="${product.variants}">
                                    <li>${variant.color}</li>
                                </c:forEach>
                            </ul>
                        </td>

                        <td>${product.category.name}</td>
                        <td><img src="/images/${product.image}" class="product-img" style="max-width: 60px;"></td>
                        <td>
                            <a href="/admin/products/edit/${product.id}" class="btn btn-sm btn-primary">Sửa</a>
                            <a href="/admin/products/delete/${product.id}" class="btn btn-sm btn-danger"
                               onclick="return confirm('Bạn chắc chắn muốn xóa sản phẩm này?')">Xóa</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>


    <!-- Pagination -->
    <c:if test="${page.totalPages > 0}">
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
    </c:if>
</section>

<!-- ✅ MỚI THÊM: Script toggle form -->
<script>
    function toggleDeleteForm() {
        const form = document.getElementById("deleteForm");
        form.classList.toggle("d-none");
    }
</script>

</body>
</html>
