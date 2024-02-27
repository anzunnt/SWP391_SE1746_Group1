<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CKEditor Example</title>
    <!-- Include jQuery library -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Include CKEditor script -->
    <script src="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>
</head>
<body>

    <textarea rows="50px"cols="100px" id="description" name="description"></textarea>

<script>
    var editor = '';
    $(document).ready(function(){
        editor = CKEDITOR.replace('description');
    });
</script>

</body>
</html>
