<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${title}</title>
    <link rel="stylesheet" href="/src/main/resources/static/style.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .animal-image {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .no-image {
            width: 100px;
            height: 100px;
            background-color: #f8f9fa;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 5px;
            color: #6c757d;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h1>${title}</h1>
        <a href="/animals/createForm" class="btn btn-primary mb-3">Add New Animal</a>
        <form method="get" action="/animals/name" class="form-inline mb-4">
            <input type="text" name="search" class="form-control mr-2" placeholder="Search by name..." required>
            <button type="submit" class="btn btn-outline-light">Search</button>
        </form>

        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Image</th>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Species</th>
                    <th>Age</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <#list animalList as animal>
                <tr>
                    <td>
                        <#if animal.imagePath?? && animal.imagePath != "">
                            <img src="${animal.imagePath}" alt="${animal.name}" class="animal-image">
                        <#else>
                            <div class="no-image">No image</div>
                        </#if>
                    </td>
                    <td>${animal.animalId}</td>
                    <td>${animal.name}</td>
                    <td>${animal.species}</td>
                    <td>${animal.age}</td>
                    <td>
                        <a href="/animals/${animal.animalId}" class="btn btn-info btn-sm">View</a>
                        <a href="/animals/update/${animal.animalId}" class="btn btn-warning btn-sm">Edit</a>
                        <a href="/animals/delete/${animal.animalId}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this animal?')">Delete</a>
                    </td>
                </tr>
                </#list>
            </tbody>
        </table>
    </div>
</body>
</html> 