<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Thêm sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2>Thêm sản phẩm mới</h2>

    <!-- Hiển thị lỗi nếu có -->
    
    <c:if test="${not empty successMessage}">
	    <div class="alert alert-success">${successMessage}</div>
	</c:if>
    
    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger">${errorMessage}</div>
    </c:if>

    <form action="/admin/products/add" method="post" enctype="multipart/form-data">
        <div class="mb-3">
            <label for="name" class="form-label">Tên sản phẩm:</label>
            <input type="text" class="form-control" id="name" name="name" onkeyup="autoFillCategory()" required>
        </div>

        <div class="mb-3">
            <label for="categoryId" class="form-label">Danh mục:</label>
            <select class="form-select" id="categoryId" name="categoryId" required>
                <option value="">-- Chọn danh mục --</option>
                <c:forEach var="cat" items="${categories}">
                    <option value="${cat.id}">${cat.name}</option>
                </c:forEach>
            </select>
        </div>

        <div class="mb-3">
            <label for="price" class="form-label">Giá:</label>
            <input type="number" step="0.01" class="form-control" id="price" name="price" required>
        </div>

        <div class="mb-3">
            <label for="description" class="form-label">Mô tả:</label>
            <textarea class="form-control" id="description" name="description" required></textarea>
        </div>

        <div class="mb-3">
            <label class="form-label">Các biến thể theo size và màu:</label>
            <div id="variantContainer">
                <!-- Biến thể đầu tiên -->
                <div class="row mb-2 variant-row">
                    <div class="col">
                        <input type="text" name="variants[0].size" class="form-control" placeholder="Size" required>
                    </div>
                    <div class="col">
                        <input type="text" name="variants[0].color" class="form-control" placeholder="Màu" required>
                    </div>
                    <div class="col">
                        <input type="number" name="variants[0].quantity" class="form-control" placeholder="Số lượng" required>
                    </div>
                    <div class="col-auto">
                        <button type="button" class="btn btn-danger remove-variant">Xóa</button>
                    </div>
                </div>
            </div>
            <button type="button" class="btn btn-secondary mt-2" onclick="addVariant()">+ Thêm biến thể</button>
        </div>

        <div class="mb-3">
            <label for="imageFile" class="form-label">Ảnh sản phẩm:</label>
            <input type="file" class="form-control" id="imageFile" name="imageFile" required>
        </div>

        <button type="submit" class="btn btn-success">Thêm sản phẩm</button>
        <a href="/admin/products" class="btn btn-secondary ms-2">Quay lại danh sách</a>
    </form>
</div>

<script type="application/json" id="categories-data">
    ${categoriesJson}
</script>

<script>
    const categories = JSON.parse(document.getElementById('categories-data').textContent || "[]");

    function autoFillCategory() {
        const name = document.getElementById('name').value.toLowerCase();
        const matchedCategory = categories.find(category =>
            name.includes(category.name.toLowerCase())
        );
        if (matchedCategory) {
            document.getElementById('categoryId').value = matchedCategory.id;
        }
    }

    function getVariantRows() {
        return document.querySelectorAll(".variant-row");
    }

    function addVariant() {
        const index = getVariantRows().length;
        const container = document.getElementById('variantContainer');
        const row = document.createElement('div');
        row.classList.add('row', 'mb-2', 'variant-row');
        row.innerHTML = `
            <div class="col">
                <input type="text" name="variants[${index}].size" class="form-control" placeholder="Size" required>
            </div>
            <div class="col">
                <input type="text" name="variants[${index}].color" class="form-control" placeholder="Màu" required>
            </div>
            <div class="col">
                <input type="number" name="variants[${index}].quantity" class="form-control" placeholder="Số lượng" required>
            </div>
            <div class="col-auto">
                <button type="button" class="btn btn-danger remove-variant">Xóa</button>
            </div>
        `;
        container.appendChild(row);
    }

    function rebuildVariantIndexes() {
        const rows = getVariantRows();
        rows.forEach((row, i) => {
            const inputs = row.querySelectorAll("input");
            inputs.forEach(input => {
                if (input.name.includes("size")) input.name = `variants[${i}].size`;
                else if (input.name.includes("color")) input.name = `variants[${i}].color`;
                else if (input.name.includes("quantity")) input.name = `variants[${i}].quantity`;
            });
        });
    }

    // Sự kiện xoá biến thể
    document.addEventListener("click", function (e) {
        if (e.target.classList.contains("remove-variant")) {
            const rows = getVariantRows();
            if (rows.length > 1) {
                e.target.closest(".variant-row").remove();
                rebuildVariantIndexes(); // cập nhật lại index sau khi xoá
            } else {
                alert("Phải có ít nhất một biến thể sản phẩm.");
            }
        }
    });

    window.onload = autoFillCategory;
</script>
</body>
</html>
