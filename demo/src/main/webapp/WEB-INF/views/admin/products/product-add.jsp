<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Thêm sản phẩm mới</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2>Thêm sản phẩm mới</h2>
    <form action="/admin/products/add" method="post">
        <div class="mb-3">
            <label for="name" class="form-label">Tên sản phẩm:</label>
            <input type="text" class="form-control" id="name" name="name" onkeyup="autoFillCategory()">
        </div>

        <div class="mb-3">
            <label for="id_category" class="form-label">ID Danh mục:</label>
            <input type="text" class="form-control" id="id_category" name="category.id" readonly>
        </div>

        <div class="mb-3">
            <label for="price" class="form-label">Giá:</label>
            <input type="number" class="form-control" id="price" name="price">
        </div>

        <div class="mb-3">
            <label for="description" class="form-label">Mô tả:</label>
            <textarea class="form-control" id="description" name="description"></textarea>
        </div>

        <div class="mb-3">
            <label for="stockQuantity" class="form-label">Số lượng tồn:</label>
            <input type="number" class="form-control" id="stockQuantity" name="stockQuantity">
        </div>

        <button type="submit" class="btn btn-primary">Thêm sản phẩm</button>
    </form>
</div>

<script>
    
    const categories = JSON.parse('${categories}'.replace(/&quot;/g, '"'));

    function autoFillCategory() {
        const name = document.getElementById('name').value.toLowerCase();
        const matchedCategory = categories.find(category =>
            name.includes(category.name.toLowerCase())
        );

        if (matchedCategory) {
            document.getElementById('id_category').value = matchedCategory.id;
        } else {
            document.getElementById('id_category').value = "";
        }
    }
</script>

</body>
</html>
