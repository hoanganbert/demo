<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
    <div class="container-fluid bg-light p-3 fixed-top">
        <nav class="navbar navbar-expand-lg navbar-light">
            <a class="navbar-brand" href="/">IOTSHOP</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/admin/home">Trang chủ</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/admin/users/search">Customer</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/admin/categories/search">Category</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/admin/videos/search">Videos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Manage Order</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/admin/accounts/search">Account</a>
                    </li>

                    <!-- Nếu đã đăng nhập -->
                    <c:if test="${account1.email != null}">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                               data-bs-toggle="dropdown" aria-expanded="false">
                                <c:if test="${account1.images != null}">
                                    <img src="/admin/accounts/images/${account1.images}" style="width:30px"
                                         class="rounded-circle">
                                </c:if>
                                <c:if test="${account1.images == null}">
                                    <img src="/images/noimage.jpg" style="width:30px" class="rounded-circle">
                                </c:if>
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#">Profiles</a></li>
                                <li><a class="dropdown-item" href="#">${account1.email}</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="/alogout">Logout</a></li>
                            </ul>
                        </li>
                    </c:if>

                    <!-- Nếu chưa đăng nhập -->
                    <c:if test="${account1.email == null}">
                        <li class="nav-item">
                            <a class="nav-link" href="/alogin">Đăng nhập</a>
                        </li>
                    </c:if>
                </ul>

                <!-- Thanh tìm kiếm -->
                <form class="d-flex" action="search">
                    <input name="name" id="name" class="form-control me-2" type="search"
                           placeholder="Nhập từ khóa để tìm" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
        </nav>
    </div>
</body>
</html>
