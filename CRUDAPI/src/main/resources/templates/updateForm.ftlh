<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${title}</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h1>${title}</h1>
        
        <form method="post" action="/animals/update/${animal.animalId}" enctype="multipart/form-data" class="mt-4">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" class="form-control" id="name" name="name" value="${animal.name}" required>
            </div>
            
            <div class="form-group">
                <label for="species">Species:</label>
                <input type="text" class="form-control" id="species" name="species" value="${animal.species}" required>
            </div>
            
            <div class="form-group">
                <label for="age">Age:</label>
                <input type="number" class="form-control" id="age" name="age" value="${animal.age}" required>
            </div>
            
            <div class="form-group">
                <label for="description">Description:</label>
                <textarea class="form-control" id="description" name="description" rows="3">${animal.description}</textarea>
            </div>
            
            <div class="form-group">
                <label for="activeDate">Active Date:</label>
                <input type="date" class="form-control" id="activeDate" name="activeDate" value="${animal.activeDate}" required>
            </div>

            <div class="form-group">
                <label for="image">Animal Image:</label>
                <#if animal.imagePath??>
                    <div class="mb-2">
                        <img src="${animal.imagePath}" alt="Current animal image" style="max-width: 200px;">
                    </div>
                </#if>
                <input type="file" class="form-control-file" id="image" name="image" accept="image/*">
                <small class="form-text text-muted">Supported formats: JPG, PNG, GIF. Leave empty to keep current image.</small>
            </div>
            
            <button type="submit" class="btn btn-primary">Update Animal</button>
            <a href="/animals/all" class="btn btn-secondary">Cancel</a>
        </form>
    </div>
</body>
</html> 