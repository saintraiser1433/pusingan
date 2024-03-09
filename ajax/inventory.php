<?php
include '../connection.php';

if ($_SERVER["REQUEST_METHOD"] == 'POST') {
    $action = @$_POST['action'];
    $itemCode = @$_POST['itemCode'];
    $itemName = @$_POST['itemName'];
    $itemDescription = @$_POST['itemDescription'];
    $itemCategory = @$_POST['itemCategory'];
    $itemSize = @$_POST['itemSize'];
    $photo = @  $itemName . time();
    $uploadsDir = '../static/item/';
    if (empty($_FILES) || !isset($_FILES['files'])) {
        $dir = "no-image.png"; // Set to NULL keyword
        $isImgUpdate = false;
    } else {
        $pth = $uploadsDir . $photo . ".png";
        $dir = $photo . ".png";
        move_uploaded_file($_FILES['files']['tmp_name'], $pth);
        $isImgUpdate = true;
    }
    if ($action == 'ADD') {
        $sql = "INSERT INTO tbl_item 
        (
            item_code,
            item_name,
            category_id,
            size_id,
            status,
            description,
            img_path
        ) 
        VALUES ('$itemCode','$itemName',$itemCategory,$itemSize,1,'$itemDescription','$dir')";
        $conn->query($sql);
    } else if ($action == 'UPDATE') {
        $itemCode = $_POST['itemCode'];
        if ($isImgUpdate) {
            $sql = "UPDATE tbl_item SET 
            item_code = '$itemCode',
            item_name = '$itemName',
            category_id = $itemCategory,
            size_id = $itemSize,
            description='$itemDescription',
            img_path='$dir'
            WHERE item_code='$itemCode'";
        } else {
            $sql = "UPDATE tbl_item SET 
            item_code = '$itemCode',
            item_name = '$itemName',
            category_id = $itemCategory,
            size_id = $itemSize,
            description='$itemDescription'
            WHERE item_code='$itemCode'";
        }

        $conn->query($sql);
    } else if ($action == 'STOCKIN') {
        $itemCode = $_POST['itemCode'];
        $qty = $_POST['qty'];
        $added = $_POST['addedqty'];
        $sql = "INSERT INTO tbl_stock_in 
        (
            item_code,
            old_quantity,
            added_quantity
        ) 
        VALUES ('$itemCode',$qty,$added)";
        $sqlupqty = "UPDATE tbl_item SET quantity=quantity+$added where item_code='$itemCode'";
        $conn->query($sqlupqty);
        $conn->query($sql);
    } else if ($action == 'RETIRE') {
        $itemCode = $_POST['itemCode'];
        $qty = $_POST['qty'];
        $remarks = $_POST['remarks'];
        $sql = "INSERT INTO tbl_retirement(item_code,quantity,remarks) VALUES ('$itemCode',$qty,'$remarks')";
        $conn->query($sql);
        $sqldel = "UPDATE tbl_item SET quantity=quantity-$qty where item_code='$itemCode'"; 
        $conn->query($sqldel);
        $sqlt = "SELECT quantity FROM tbl_item where item_code ='$itemCode'";
        $rs = $conn->query($sqlt);
        if ($rs->num_rows > 0) {
            $row = $rs->fetch_assoc();
            if ($row['quantity'] == 0) {
                $sqlx = "UPDATE tbl_item SET status= 0 where item_code='$itemCode'";
                $conn->query($sqlx);
            } 
           
        }
    }
} else if ($_SERVER["REQUEST_METHOD"] == 'GET') {
    $itemCode = $_GET['itemCode'];
    $sql = "SELECT
    a.item_code,
    a.item_name,
    a.category_id,
    a.quantity,
    a.size_id,
    a.status,
    a.description,
    a.img_path
FROM
tbl_item a
WHERE item_code = '$itemCode'";
    $rs = $conn->query($sql);
    $data = [];
    if ($rs) {
        while ($row = $rs->fetch_assoc()) {
            $data[] = [
                'item_code' => $row['item_code'],
                'item_name' => $row['item_name'],
                'category_id' => $row['category_id'],
                'size_id' => $row['size_id'],
                'quantity' => $row['quantity'],
                'status' => $row['status'],
                'description' => $row['description'],
                'img_path' => $row['img_path'],
            ];
        }
    }
    echo json_encode($data);
}
