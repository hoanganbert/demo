<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Chỉnh sửa sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2>Chỉnh sửa sản phẩm</h2>

    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger">${errorMessage}</div>
    </c:if>

    <form action="/admin/products/edit" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${product.id}"/>

        <div class="mb-3">
            <label for="name" class="form-label">Tên sản phẩm:</label>
            <input type="text" class="form-control" id="name" name="name" value="${product.name}" onkeyup="autoFillCategory()" required>
        </div>

        <div class="mb-3">
            <label for="categoryId" class="form-label">Danh mục:</label>
            <select class="form-select" id="categoryId" name="categoryId" required>
                <c:forEach var="cat" items="${categories}">
                    <option value="${cat.id}" ${cat.id == product.category.id ? 'selected' : ''}>${cat.name}</option>
                </c:forEach>
            </select>
        </div>

        <div class="mb-3">
            <label for="price" class="form-label">Giá:</label>
            <input type="number" step="0.01" class="form-control" id="price" name="price" value="${product.price}" required>
        </div>

        <div class="mb-3">
            <label for="description" class="form-label">Mô tả:</label>
            <textarea class="form-control" id="description" name="description" required>${product.description}</textarea>
        </div>

        <div class="mb-3">
            <label class="form-label">Các biến thể theo size và màu:</label>
            <div id="variantContainer">
                <c:forEach var="variant" items="${variants}" varStatus="status">
                    <div class="row mb-2 variant-row">
                        <input type="hidden" name="variants[${status.index}].id" value="${variant.id}" />
                        <div class="col">
                            <input type="text" name="variants[${status.index}].size" class="form-control" value="${variant.size}" required>
                        </div>
                        <div class="col">
                            <input type="text" name="variants[${status.index}].color" class="form-control" value="${variant.color}" required>
                        </div>
                        <div class="col">
                            <input type="number" name="variants[${status.index}].quantity" class="form-control" value="${variant.quantity}" required>
                        </div>
                        <div class="col-auto">
                            <button type="button" class="btn btn-danger remove-variant">Xóa</button>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <button type="button" class="btn btn-secondary mt-2" onclick="addVariant()">+ Thêm biến thể</button>
        </div>

        <div class="mb-3">
            <label class="form-label">Ảnh sản phẩm:</label><br>
            <c:if test="${not empty product.image}">
                <img src="${product.image}" alt="Ảnh hiện tại" width="150" class="mb-2" /><br>
            </c:if>
            <input type="file" class="form-control" name="imageFile">
        </div>

        <button type="submit" class="btn btn-primary">Cập nhật sản phẩm</button>
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

    let variantIndex = document.querySelectorAll('.variant-row').length;

    function addVariant() {
        const container = document.getElementById('variantContainer');
        const row = document.createElement('div');
        row.classList.add('row', 'mb-2', 'variant-row');
        row.innerHTML = `
            <input type="hidden" name="variants[${variantIndex}].id" value="" />
            <div class="col">
                <input type="text" name="variants[${variantIndex}].size" class="form-control" placeholder="Size" required>
            </div>
            <div class="col">
                <input type="text" name="variants[${variantIndex}].color" class="form-control" placeholder="Màu" required>
            </div>
            <div class="col">
                <input type="number" name="variants[${variantIndex}].quantity" class="form-control" placeholder="Số lượng" required>
            </div>
            <div class="col-auto">
                <button type="button" class="btn btn-danger remove-variant">Xóa</button>
            </div>
        `;
        container.appendChild(row);
        variantIndex++;
    }

    document.addEventListener("click", function (e) {
        if (e.target.classList.contains("remove-variant")) {
            if (document.querySelectorAll('.variant-row').length > 1) {
                e.target.closest(".variant-row").remove();
            } else {
                alert("Phải có ít nhất một biến thể sản phẩm.");
            }
        }
    });

    window.onload = autoFillCategory;
</script>
</body>
</html>
