# CRUD_API
CRUD API assignment

## Description
A comprehensive CRUD (Create, Read, Update, Delete) API for managing Animal objects.

## Version
1.0.0

## Installation

### Get the project
1. Clone the repository:
git clone git@github.com:FadyEskand22/CRUD_API.git
Or download as ZIP.

2. This project is built to run with Spring Boot and JDK 21.

### Database Configuration
The `/src/main/resources/application.properties` file contains the configuration for the MySQL database:

1. First create and initialize the database. The database name is `crudapi_database`.
2. Ensure MySQL running before starting the application.
3. Start your MySQL Server.
5. Verify your username and password in the properties file match your MySQL.

### File Upload Configuration
The application uses a local directory for storing uploaded images:
1. The upload directory is configured in `application.properties` as `file.upload-dir=./uploads`
2. The application will create this directory automatically if it doesn't exist
3. Maximum file upload size is set to 10MB

## Project Structure

### Entity
The `Animal` class is annotated with `@Entity` and contains:
- `animalId` (Primary Key, auto-generated)
- `name`
- `description`
- `species`
- `age`
- `activeDate`
- `imagePath`

### Repository
`AnimalRepository` extends `JpaRepository`:
- Provides standard CRUD operations
- Includes custom queries for finding animals by name and species

### Service
`AnimalService` handles business logic:
- Manages CRUD operations through the repository
- Handles data validation and business rules
- Autowired with the repository

### Controller
`AnimalController` manages HTTP endpoints:
- Base path: `/animals`
- Handles file uploads for animal images
- Returns views using FreeMarker templates

## API Endpoints

### `/animals/all` (GET)
Gets a list of all Animals in the database.

Response - A web page displaying all animals in a table format with their images that are uploadedd.

### `/animals/{id}` (GET)
Gets an individual Animal's details.

Response - A detailed view of the animal including an image.

### `/animals/createForm` (GET)
Shows the form to create a new animal.

Response - A web form for adding a new animal.

### `/animals/create` (POST)
Creates a new Animal entry.

Parameters:
- Form Data: name, species, age, description, activeDate
- File: image (optional)

Response - Redirects to the animal list page.

### `/animals/update/{id}` (GET)
Shows the form to update an existing animal.

Parameters:
- Path Variable: id <integer> - REQUIRED

Response - A web form pre-filled with the animal's current data.

### `/animals/update/{id}` (POST)
Updates an existing Animal.

Parameters:
- Path Variable: id <integer> - REQUIRED
- Form Data: name, species, age, description, activeDate
- File: image (optional)

Response - Redirects to the animal list page.

### `/animals/delete/{id}` (GET)
Deletes an existing Animal.

Parameters:
- Path Variable: id <integer> - REQUIRED

Response - Redirects to the animal list page.

### `/animals/name` (GET)
Searches for animals by name.

Parameters:
- Query Parameter: search <String> - REQUIRED

Response - A list of matching animals.

### `/animals/species/{species}` (GET)
Gets a list of animals of a specific species.

Parameters:
- Path Variable: species <String> - REQUIRED

Response - A list of animals of the specified species.

## Views
For the UI:
- `list.ftlh` - Displays all animals in a table
- `view.ftlh` - Shows information about a single animal
- `createForm.ftlh` - Form for creating new animals
- `updateForm.ftlh` - Form for updating existing animals
