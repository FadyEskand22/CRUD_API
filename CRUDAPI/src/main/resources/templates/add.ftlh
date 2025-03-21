<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Animal</title>
    <link rel="stylesheet" href="/src/main/resources/static/style.css">
</head>
<body>
    <h1>Add New Animal</h1>
    <form action="/animals/new" method="post">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>
        <label for="description">Description:</label>
        <textarea id="description" name="description" required></textarea>
        <label for="species">Species:</label>
        <input type="text" id="species" name="species">
        <label for="age">Age:</label>
        <input type="number" id="age" name="age" step="0.1">
        <label for="activeDate">Active Date:</label>
        <input type="date" id="activeDate" name="activeDate">
        <button type="submit">Add Animal</button>
    </form>
</body>
</html> 