<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>페이지 A</title>
</head>
<body>

<script>
    let testWord = [
        {username: "ssar", password: 1234}, {username: "ssar", password: 1234}, {username: "happy", password: 1111}, {username: "happy", password: 1111}
    ];

    let newWord = [];
    testWord.forEach((word) => {
        if (!newWord.some(item => item.username === word.username && item.password === word.password)) {
            newWord.push(word);
        }
    });

    newWord.forEach((newWord) => {
        console.log(newWord);

    })


</script>
</body>
</html>
