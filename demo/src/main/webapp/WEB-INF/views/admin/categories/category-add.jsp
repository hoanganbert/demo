<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Thêm danh mục</title>
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
        .navigation .nav-item:hover,
        .navigation .logout:hover {
            text-decoration: underline;
        }
        .navigation .logout {
            color: #ffc107;
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

<!-- Form Section -->
<section class="container mt-5">
    <h2 class="fw-bold mb-4">➕ Thêm danh mục</h2>

    <!-- Hiển thị thông báo -->
    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>
    <c:if test="${not empty success}">
        <div class="alert alert-success">${success}</div>
    </c:if>

    <form id="categoryForm" method="post" action="/admin/categories/add">
        <div class="mb-3">
            <label class="form-label">Tên danh mục:</label>
            <input type="text" id="name" name="name" class="form-control" required />
            <div class="invalid-feedback" id="nameFeedback"></div>
        </div>
        <div class="d-flex justify-content-between">
            <a href="/admin/categories" class="btn btn-secondary" id="backButton">← Quay lại</a>
            <button type="submit" class="btn btn-success">Lưu</button>
        </div>
    </form>
</section>

<!-- JS kiểm tra và validate -->
<script>
    let formChanged = false;
    const nameInput = document.getElementById("name");
    const feedback = document.getElementById("nameFeedback");

    nameInput.focus();

    nameInput.addEventListener("input", function () {
        formChanged = true;

        const value = nameInput.value.trim();
        const isValid = /^[a-zA-ZÀ-ỹ0-9\s]{3,50}$/.test(value);

        if (!isValid) {
            nameInput.classList.add("is-invalid");
            feedback.textContent = "Tên phải từ 3-50 ký tự, không chứa ký tự đặc biệt.";
            return;
        }

        // Kiểm tra trùng tên bằng AJAX
        fetch("/admin/categories/check-name?name=" + encodeURIComponent(value))
            .then(res => res.json())
            .then(data => {
                if (data.exists) {
                    nameInput.classList.add("is-invalid");
                    feedback.textContent = "Tên danh mục đã tồn tại.";
                } else {
                    nameInput.classList.remove("is-invalid");
                    feedback.textContent = "";
                }
            });
    });

    document.getElementById("categoryForm").addEventListener("submit", function (e) {
        if (nameInput.classList.contains("is-invalid")) {
            e.preventDefault();
        }
        formChanged = false;
    });

    window.addEventListener("beforeunload", function (e) {
        if (formChanged) {
            const message = "Bạn có thay đổi chưa lưu. Bạn có chắc muốn rời?";
            e.returnValue = message;
            return message;
        }
    });

    document.getElementById("backButton").addEventListener("click", function (e) {
        if (formChanged && !confirm("Bạn có thay đổi chưa lưu. Bạn có chắc muốn quay lại?")) {
            e.preventDefault();
        }
    });
</script>

</body>
</html>
