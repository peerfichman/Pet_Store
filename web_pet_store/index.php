<!DOCTYPE html>

<?php


include "queries.php";
include "procedures.php";
include "functions.php";
include "menus.php";
include "config.php";

if (isset($_POST["query"])) {
    switch ($_POST["query"]) {
        case "1":
            $query = $query1;
            break;
        case "2":
            if (empty($_POST["num_weeks"])) {
                $message = "Enter a valid option!";
            } else
                $query = concatQuery2($_POST["num_weeks"]);
            break;
        case "3":
            $query =  $query3;
            break;
        case "4":
            $query =  $query4;
            break;
        case "5":
            $query =  $query5;
            break;
        case "6":
            $query =  $query6;
            break;
        case "7":
            $query =  $query7;
            break;
        case "8":
            if (empty($_POST["num_months"])) {
                $message = "Enter a valid option!";
            } else
                $query =  concatQuery8($_POST["num_months"]);
    }
} elseif (isset($_POST["proc"])) {
    switch ($_POST["proc"]) {
        case "1":
            if (empty($_POST["order_id"]) || empty($_POST["worker_id"])) {
                $message = "Enter a valid option!";
            } else {
                mysqli_query($connection, concatProcCall1($_POST["order_id"], $_POST["worker_id"]));
                $query = queryProc1Res($_POST["order_id"], $_POST["worker_id"]);
            }
            break;

        case "2":
            if (empty($_POST["num_products"]) || empty($_POST["num_days"])) {
                $message = "Enter a valid option!";
            } else
                $query = concatProcCall2($_POST["num_products"], $_POST["num_days"]);
            break;

        case "3":
            if (empty($_POST["disc_perc"]) || empty($_POST["order_id"]) || $_POST["disc_perc"] > 100) {
                $message = "Enter a valid option!";
            } else
                $query = concatProcCall3($_POST["disc_perc"], $_POST["order_id"]);
            break;
    }
} elseif (isset($_POST["func1"])) {
    if (empty($_POST["worker_id"]) || empty($_POST["month-year"])) {
        $message = "Enter a valid option!";
    } else {
        $date = explode("-", $_POST["month-year"]);
        $query = concatFuncCall1($_POST["worker_id"], $date[0], $date[1]);
        $workername = explode("_", getWorkerNamebyId($_POST["worker_id"]));
    }
}



if (isset($query))
    $result = mysqli_query($connection, $query);
?>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Home-page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="css/style.css">
    <script src="js/script.js"></script>

</head>

<body>
    <header>
        <a href="#"><img src="./images/shop_logo.png" alt="" class="logo"></a>
    </header>
    <div id="wrapper" class="ms-auto">
        <div class="accordion mb-5" id="accordionExample">
            <div class="accordion-item">
                <h2 class="accordion-header" id="headingOne">
                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                        <strong> Queries</strong>
                    </button>
                </h2>
                <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                        <div class="list-group">
                            <form action="#" method="POST">
                                <div class="list-group-item list-group-item-action d-flex justify-content-between">
                                    <p>Display all products and stock quantity</p>
                                    <button class="btn btns" type="Submit" value="1" name="query"><i class="bi bi-arrow-right-circle-fill"></i></button>
                                </div>
                            </form>
                            <form action="#" method="POST">
                                <div class="list-group-item list-group-item-action d-flex justify-content-between">
                                    <p>Display all orders in the last <input type="number" name="num_weeks" min="0" /> weeks</p>
                                    <button class="btn btns" type="submit" value="2" name="query"><i class="bi bi-arrow-right-circle-fill"></i></button>

                                </div>
                            </form>
                            <form action="#" method="POST">
                                <div class="list-group-item list-group-item-action d-flex justify-content-between">
                                    <p>Display employee who sold the most products</p>
                                    <button class="btn btns" type="Submit" value="3" name="query"><i class="bi bi-arrow-right-circle-fill"></i></button>
                                </div>
                            </form>
                            <form action="#" method="POST">
                                <div class="list-group-item list-group-item-action d-flex justify-content-between">
                                    <p>Display the employee who earned most money</p>
                                    <button class="btn btns" type="Submit" value="4" name="query"><i class="bi bi-arrow-right-circle-fill"></i></button>
                                </div>
                            </form>
                            <form action="#" method="POST">
                                <div class="list-group-item list-group-item-action d-flex justify-content-between">
                                    <p>Display active orders and the customer who ordered</p>
                                    <button class="btn btns" type="Submit" value="5" name="query"><i class="bi bi-arrow-right-circle-fill"></i></button>
                                </div>
                            </form>
                            <form action="#" method="POST">
                                <div class="list-group-item list-group-item-action d-flex justify-content-between">
                                    <p>Display customers who haven't placed any orders</p>
                                    <button class="btn btns" type="Submit" value="6" name="query"><i class="bi bi-arrow-right-circle-fill"></i></button>
                                </div>
                            </form>
                            <form action="#" method="POST">
                                <div class="list-group-item list-group-item-action d-flex justify-content-between">
                                    <p>Display repeating customers</p>
                                    <button class="btn btns" type="Submit" value="7" name="query"><i class="bi bi-arrow-right-circle-fill"></i></button>
                                </div>
                            </form>
                            <form action="#" method="POST">
                                <div class="list-group-item list-group-item-action d-flex justify-content-between">
                                    <p>Display income <input type="number" name="num_months" min="0" required>
                                        months back</p>
                                    <button class="btn btns" type="Submit" value="8" name="query"><i class="bi bi-arrow-right-circle-fill"></i></button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="accordion-item">
                <h2 class="accordion-header" id="headingTwo">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                        <strong> Procedures </strong>
                    </button>
                </h2>
                <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                        <div class="list-group">
                            <div class="list-group-item list-group-item-action">
                                <form action="#" method="POST" class=" d-flex align-items-center justify-content-between">
                                    <div>
                                        <label class="form-check-label"><strong>Update delivery for an order -</strong> updates the end of delivery for existing order </label>
                                    </div>
                                    <div>
                                        <label> Select order id:</label>
                                        <select class="form-select form-select-sm mb-3" aria-label=".form-select-lg example" name="order_id">
                                            <?php
                                            while ($idOption = mysqli_fetch_assoc($resAllordersId)) {
                                                echo '<option value="' . $idOption["order_id"] . '">' . $idOption["order_id"] . '</option>';
                                            }
                                            ?>
                                        </select>
                                    </div>
                                    <div>
                                        <label> Select delivery person:</label>
                                        <select class="form-select form-select-sm mb-3 " aria-label=".form-select-lg example" name="worker_id">
                                            <?php
                                            while ($deliverOption = mysqli_fetch_assoc($resAllDelivers)) {
                                                echo '<option value="' . $deliverOption["worker_id"] . '">' . $deliverOption["work_fname"] . " " . $deliverOption["work_lname"] . '</option>';
                                            }
                                            ?>
                                        </select>
                                    </div>
                                    <button class="btn btns" type="Submit" value="1" name="proc"><i class="bi bi-arrow-right-circle-fill"></i></button>
                                </form>
                            </div>
                            <form action="#" method="POST">
                                <div class="list-group-item list-group-item-action d-flex justify-content-between">
                                    <p>Report displaying a list of <input type="number" name="num_products" min="0" /> most sold products in the last <input type="number" name="num_days" min="0" /> days</p>
                                    <button class="btn btns" type="submit" value="2" name="proc"><i class="bi bi-arrow-right-circle-fill"></i></button>

                                </div>
                            </form>
                            <form action="#" method="POST">
                                <div class="list-group-item list-group-item-action d-flex justify-content-between align-items-strech">
                                    <div class="w-50">
                                        <label class="form-check-label"><strong>Giving a discount in precentages - </strong> updates the order price according to the amount of the discount that will be given in percentages</label>
                                    </div>
                                    <div>
                                        <label> Select order id:</label>
                                        <select class="form-select form-select-sm mb-3" aria-label=".form-select-lg example" name="order_id">
                                            <?php
                                            while ($optionId = mysqli_fetch_assoc($resAllOrders)) {
                                                echo '<option value="' . $optionId["order_id"] . '">' . $optionId["order_id"] . '</option>';
                                            }
                                            ?>
                                        </select>
                                    </div>
                                    <div>
                                        <label> Input discount in percents:</label>
                                        <div class="input-group input-group-sm mb-3">
                                            <input type="number" name="disc_perc" class="form-control" step="0.01" min="0">
                                            <span class=" input-group-text">%</span>
                                        </div>
                                    </div>
                                    <button class="btn btns" type="Submit" value="3" name="proc"><i class="bi bi-arrow-right-circle-fill"></i></button>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingThree">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                            <strong> Functions </strong>
                        </button>
                    </h2>
                    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            <div class="list-group">
                                <form action="#" method="POST" class=" d-flex align-items-center justify-content-between">
                                    <div>
                                        <label class="form-check-label">For each seller, the amount of revenue for a certain month </label>
                                    </div>
                                    <div>
                                        <label> Select Seller:</label>
                                        <select class="form-select form-select-sm mb-3" aria-label=".form-select-lg example" name="worker_id">
                                            <?php
                                            while ($sellerOption = mysqli_fetch_assoc($resAllSellers)) {
                                                echo '<option value="' . $sellerOption["worker_id"] . '">' . $sellerOption["work_fname"] . " " . $sellerOption["work_lname"] . '</option>';
                                            }
                                            ?>
                                        </select>
                                    </div>
                                    <div class="align-self-start ">
                                        <label> Select month and year</label>
                                        <input type="month" name="month-year" class="form-control" />
                                        </select>
                                    </div>
                                    <button class="btn btns" type="Submit" value="Submit" name="func1"><i class="bi bi-arrow-right-circle-fill"></i></button>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div <?php
                if (isset($_POST["empty"]) && $_POST["empty"] == "yes") {
                    echo 'style="display:none;"';
                }

                ?>>
            <?php
            if (!isset($result) && isset($message)) {
                echo '<div id= "table" class="alert alert-warning alert-dismissible fade show w-100 h-100" role="alert">';
                echo $message;
                echo '<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>';
                echo '</div>';
            } else if (isset($result)) {
                $row = mysqli_fetch_assoc($result);
                if (null == $row) {
                    echo '<div id= "table" class="alert alert-danger alert-dismissible fade show w-100" role="alert">';
                    echo 'Table is empty!';
                    echo '<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>';
                    echo '</div>';
                } else {
                    echo '<div id= "table" class="rectangle">';
                    echo   '<table class="table">';
                    echo '<thead>';
                    echo     '<tr>';
                    foreach ($row as $col_name => $value) {
                        if ($col_name == "MonthlyIncome") {
                            echo         '<th scope="col"> Monthly Income for ' . $workername[0] . " " . $workername[1] . ' on ' . $date[1] . "/" . $date[0] . '</th>';
                        } else {
                            echo         '<th scope="col">' . $col_name . '</th>';
                        }
                    }
                    echo     '</tr>';
                    echo '</thead>';
                    echo '<tbody>';
                    while ($row) {
                        echo     '<tr>';
                        foreach ($row as $col_name => $value) {
                            if ($col_name == "delivery sent" || $col_name == "active") {
                                if ($value == "1")
                                    echo         '<td> true </td>';
                                else
                                    echo         '<td> false </td>';
                            } else {
                                echo         '<td>' . $value . '</td>';
                            }
                        }
                        echo     '</tr>';
                        $row = mysqli_fetch_assoc($result);
                    }
                    echo '</tbody>';
                    echo '</table>';
                    echo '<form action="#" method="POST" class="d-flex align-items-center justify-content-center">';
                    echo ' <button type="submit" name="empty" value="yes" class="btn btn-outline-warning mb-3"> Clear Table</button>';
                    echo ' </form>';
                    echo '</div>';
                }
            }
            ?>
        </div>
    </div>

    <footer>
        <p>&copy Tomer Duchovni & Pe'er Fikhman</p>
    </footer>
    <?php
    if (isset($result))
        mysqli_free_result($result);
    ?>
</body>

</html>
<?php
mysqli_close($connection);
?>