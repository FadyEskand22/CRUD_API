<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Animal</title>
    <link rel="stylesheet" href="/src/main/resources/static/style.css">
</head>
<body>
    <h1>Edit Animal</h1>
    <form action="/animals/update/${animal.animalId}" method="post">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" value="${animal.name}" required>
        <label for="description">Description:</label>
        <textarea id="description" name="description" required>${animal.description}</textarea>
        <label for="species">Species:</label>
        <input type="text" id="species" name="species" value="${animal.species}">
        <label for="age">Age:</label>
        <input type="number" id="age" name="age" value="${animal.age}" step="0.1">
        <label for="activeDate">Active Date:</label>
        <input type="date" id="activeDate" name="activeDate" value="${animal.activeDate}">
        <button type="submit">Update Animal</button>
    </form>
</body>
</html> 