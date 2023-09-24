<?php
require_once 'include/connect.php';
$user_id = '1';
function render_question($question_id)
{
    global $user_id;
    global $conn;

    $query = "SELECT * FROM questions WHERE user_id = '$user_id' AND question_code = '$question_id' ";
    $res = mysqli_query($conn, $query);
    $result = mysqli_fetch_assoc($res);
    // var_dump($query);
    // echo "<br/>";

    return $result['question'];
}

function render_input($question_id)
{
    global $conn;
    global $user_id;

    $query = "SELECT * FROM questions WHERE user_id = '$user_id' AND question_code = '$question_id' ";
    // echo $query;
    // echo "<br/>";
    $res = mysqli_query($conn, $query);
    $result = mysqli_fetch_assoc($res);
    // echo "<br/>";
    // var_dump($result);

    $question_type = $result['question_type'];
    $question_code = $result['question_code'];

    $query = "SELECT * FROM choices WHERE question_code = '$question_id' ";
    // echo $query;
    // echo "<br/>";
    $res = mysqli_query($conn, $query);

    $response = "";

    switch ($question_type) {

        case 'radio':
            foreach ($res as $row) {
                $response .= "
                <div class='form-check'>
                    <input type='radio' class='form-check-input' id='{$row['choice_code']}' name='{$row['choice_group_code']}' required value='{$row['choice_value']}' >
                    <label class='form-check-label' for='{$row['choice_code']}'> {$row['choice_value']} </label>
                </div>
                ";
            }
            $response .= "<input type='hidden' name='question_code2' value='{$row['question_code']}' />";
            break;

        default:
            $response = "
            <div class='form-group'>
                <input type='text' class='form-control' name='textbox' required id='textbox' placeholder='Eg: John Doe...' />
                <input type='hidden' name='question_code1' value='$question_code' />
            </div>
        ";
            break;

    }
    return $response;
}

function generateRandomString($length = 8)
{
    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $randomString = '';

    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, strlen($characters) - 1)];
    }

    return $randomString;
}

if (isset($_POST['submit'])) {

    $name = $_POST['textbox'];
    $gender = $_POST['gender'];
    $q1 = $_POST['question_code1'];
    $q2 = $_POST['question_code2'];
    $resp_group = generateRandomString();

    $query = "INSERT INTO response (question_code, user_id, response,group_code) values ('$q1','$user_id','$name','$resp_group'), ('$q2','$user_id','$gender','$resp_group') ";
    // echo $query;
    $res = mysqli_query($conn, $query);
}

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <title> Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .label {
            font-weight: bold;
        }
    </style>
</head>

<body>

    <div class="container mt-5 pt-5 ml-5 mr-5">
        <?php
        if (isset($_POST['submit'])) {
            $q = "SELECT q.question, r.response, r.user_id, r.group_code FROM
             response r, questions q
             WHERE q.question_code = r.question_code
              order by r.id desc limit 2";
            // echo $q;
            $res = mysqli_query($conn, $q);
            $data = "";
            foreach ($res as $row) {
                $data .= "<tr>
                            <td>{$row['question']}</td>
                            <td>{$row['response']}</td>
                            <td>{$row['user_id']}</td>
                            <td>{$row['group_code']}</td>
                        </tr>";
            }
            echo "
                    <table class='tbl table table-responsive table-bordered'>
                        <thead  class='text-bg-dark' style='background-color:black;color:white;'>
                            <tr>
                                <th> Question </th>
                                <th> Response</th>
                                <th> User ID</th>
                                <th> Group Code</th>
                            </tr>
                            </thead>
                            $data
                    </table>
                ";

        }
        ?>
        <form method='post' name='xyz' onsubmit='return validate_form()'>
            <div class='container' id='step1'>

                <div class="row">
                    <div class="col-md-12">
                        <label class='label'>
                            <?= render_question('Q001') ?>
                        </label>
                    </div>
                    <div class="col-md-12">
                        <?= render_input('Q001') ?>
                    </div>
                    <div class='col-md-8'></div>
                    <div class='col-md-4 mt-5'>
                        <button type='button' class='btn btn-primary' onclick='validate_input()'>Next</button>
                    </div>
                </div>

            </div>


            <div class='container' id='step2'>
                <div class="row">
                    <div class="col-md-12">
                        <label>
                            <?= render_question('Q002') ?>
                        </label>
                    </div>
                    <div class="col-md-12">
                        <?= render_input('Q002') ?>
                    </div>
                    <div class='col-md-3 mt-5'>
                        <button type='button' class='btn btn-primary' onclick='go_back()'>Back</button>
                    </div>
                    <div class='col-md-5'></div>
                    <div class='col-md-4 mt-5'>
                        <button type='submit' name='submit' class='btn btn-primary'>Submit</button>
                    </div>
                </div>
            </div>

        </form>
    </div>

    <script>

        var step1 = document.getElementById('step1');
        var step2 = document.getElementById('step2');
        var text = document.getElementById("textbox");

        window.onload = on_load;

        function on_load() {
            hide(step2);
        }

        function hide(obj) {
            obj.style.display = 'none';
        }

        function show(obj) {
            obj.style.display = 'block';
        }

        function validate_input() {

            if (text.value == '')
                return false;

            hide(step1);
            show(step2);
        }

        function go_back() {
            hide(step2);
            show(step1);
        }

        function validate_form() {

            if (text.value != "")
                return true;

            return false;
        }
    </script>
</body>

</html>