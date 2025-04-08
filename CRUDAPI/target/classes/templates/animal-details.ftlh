<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${title}</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .animal-image {
            max-width: 100%;
            height: auto;
            max-height: 400px;
            object-fit: contain;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        .image-container {
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
        }
        .no-image {
            width: 100%;
            height: 200px;
            background-color: #f8f9fa;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 8px;
            color: #6c757d;
            font-size: 1.2em;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h1>${title}</h1>
        
        <div class="card">
            <div class="card-body">
                <div class="image-container">
                    <#if animal.imagePath?? && animal.imagePath != "">
                        <img src="${animal.imagePath}" alt="${animal.name}" class="animal-image">
                    <#else>
                        <div class="no-image">No image available</div>
                    </#if>
                </div>
                <h5 class="card-title">${animal.name}</h5>
                <p class="card-text"><strong>Species:</strong> ${animal.species}</p>
                <p class="card-text"><strong>Age:</strong> ${animal.age}</p>
                <p class="card-text"><strong>Description:</strong> ${animal.description}</p>
                <p class="card-text"><strong>Active Date:</strong> ${animal.activeDate}</p>
            </div>
        </div>

        <div class="mt-3">
            <a href="/animals/update/${animal.animalId}" class="btn btn-warning">Edit</a>
            <a href="/animals/delete/${animal.animalId}" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this animal?')">Delete</a>
            <a href="/animals/all" class="btn btn-secondary">Back to List</a>
        </div>
    </div>
</body>
</html> 