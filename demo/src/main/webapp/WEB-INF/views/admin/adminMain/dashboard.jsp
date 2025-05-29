<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        body {
            margin: 0;
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #ece9e6, #ffffff);
            height: 100vh;
            overflow: hidden;
        }

        /* Navbar */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #2c3e50;
            padding: 12px 20px;
            color: white;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        .navbar a {
            color: white;
            text-decoration: none;
            margin-right: 20px;
            font-weight: 500;
            transition: 0.3s;
        }

        .navbar a:hover {
            text-decoration: underline;
        }

        .menu {
            display: flex;
            gap: 20px;
        }

        /* Main content */
        .main-content {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: calc(100vh - 60px);
            text-align: center;
            animation: fadeIn 2s ease-in;
        }

        /* Welcome animation text */
        .welcome-text {
            font-size: 40px;
            font-weight: bold;
            background: linear-gradient(90deg, #ff6a00, #ee0979);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            animation: slideIn 2s ease-in-out, glow 1.5s infinite alternate;
        }

        .sub-text {
            font-size: 20px;
            color: #555;
            margin-top: 10px;
            animation: fadeIn 3s ease-in;
        }

        .animated-gif {
            margin-top: 30px;
            width: 300px;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.2);
        }

        @keyframes slideIn {
            0% {
                opacity: 0;
                transform: translateY(-30px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes glow {
            from {
                text-shadow: 0 0 10px #ff6a00;
            }
            to {
                text-shadow: 0 0 20px #ee0979;
            }
        }

        @keyframes fadeIn {
            from { opacity: 0 }
            to { opacity: 1 }
        }
    </style>
</head>
<body>
<div class="navbar">
    <div class="menu">
        <a href="/admin/products">📘 Quản lý sản phẩm</a>
        <a href="/admin/categories">📁 Quản lý danh mục</a>
        <a href="/admin/orders">📦 Quản lý đơn hàng</a>
        <a href="/admin/shipping">🚚 Quản lý giao hàng</a>
        <a href="/admin/customers">👥 Quản lý khách hàng</a>
        <a href="/admin/promotions">🎁 Quản lý khuyến mãi</a>
        <a href="/admin/statistics">📊 Thống kê & Báo cáo</a>
    </div>
    <div>
        <a href="/logout" style="color: orange;">🔓 Đăng xuất</a>
    </div>
</div>

<div class="main-content">
    <div class="welcome-text">✨ Welcome to Admin Dashboard ✨</div>
    <div class="sub-text">Quản lý hệ thống website bán hàng dễ dàng, hiện đại và nhanh chóng!</div>
    <img class="animated-gif" src="https://media.giphy.com/media/du3J3cXyzhj75IOgvA/giphy.gif" alt="Animated Dashboard Welcome">
</div>
</body>
</html>
