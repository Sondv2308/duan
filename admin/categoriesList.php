<?php
include '../lib/session.php';
include '../classes/categories.php';
Session::checkSession('admin');
$role_id = Session::get('role_id');
if ($role_id == 1) {

} else {
    header("Location:../index.php");
}


$categories = new categories();
$list = $categories->getAllAdmin((isset($_GET['page']) ? $_GET['page'] : 1));
$pageCount = $categories->getCountPaging();

?>
<?php

if (isset($_GET['delete'])) {
    $categoryId = $_GET['delete'];
    $result = $categories->delete($categoryId);
    if ($result) {
        echo "<script>alert('Xóa danh mục thành công'); window.location.href='categoriesList.php';</script>";
    } else {
        echo "<script>alert('Xóa danh mục thất bại'); window.location.href='categoriesList.php';</script>";
    }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="https://use.fontawesome.com/2145adbb48.js"></script>
    <script src="https://kit.fontawesome.com/a42aeb5b72.js" crossorigin="anonymous"></script>
    <title>Danh sách danh mục</title>
</head>

<body>
    <nav>
        <input type="checkbox" id="check">
        <label for="check" class="checkbtn">
            <i class="fas fa-bars"></i>
        </label>
        <label class="logo">ADMIN</label>
        <ul>
            <li><a href="productlist.php" >Quản lý Sản phẩm</a></li>
            <li><a href="categoriesList.php" class="active">Quản lý danh mục</a></li>
            <li><a href="orderlist.php" id="order">Quản lý Đơn hàng</a></li>
        </ul>
    </nav>
    <div class="title">
        <h1>Danh sách danh mục</h1>
    </div>
    <div class="addNew">
        <a href="add_category.php">Thêm mới</a>
    </div>
    <div class="container">
        <?php $count = 1;
        if ($list) { ?>
            <table class="list">
                <tr>
                    <th>STT</th>
                    <th>Tên danh mục</th>
                
                    <th>Thao tác</th>
                </tr>
                <?php foreach ($list as $key => $value) { ?>
                    <tr>
                        <td><?= $count++ ?></td>
                        <td><?= $value['name'] ?></td>
                      
<td>
    <a href="edit_category.php?id=<?= $value['id'] ?>">Sửa</a>
    <a href="categoriesList.php?delete=<?= $value['id'] ?>" onclick="return confirm('Bạn chắc chắn muốn xóa danh mục này?')">Xóa</a>

</td>

                    </tr>
                <?php } ?>
            </table>
        <?php } else { ?>
            <h3>Chưa có danh mục nào...</h3>
        <?php } ?>

    </div>
    </div>
    
    <footer>
        <p class="copyright">AZShop @ 2023</p>
    </footer>
</body>

</html>