package com.CRUDAPI.CRUDAPI;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/animals")
public class AnimalController {

    @Autowired
    private AnimalService animalService;

    @Value("${file.upload-dir}")
    private String uploadDir;

    @GetMapping("/all")
    public String getAllAnimals(Model model) {
        List<Animal> animals = animalService.getAllAnimals();
        model.addAttribute("animalList", animals);
        model.addAttribute("title", "Animal List");
        return "list";
    }

    @GetMapping("/{id}")
    public String getAnimalById(@PathVariable Integer id, Model model) {
        Animal animal = animalService.getAnimalById(id);
        model.addAttribute("animal", animal);
        model.addAttribute("title", "View Animal - " + id);
        return "view";
    }

    @GetMapping("/createForm")
    public String showCreateForm(Model model) {
        model.addAttribute("title", "Add New Animal");
        return "createForm";
    }

    @PostMapping("/create")
    public String addNewAnimal(@ModelAttribute Animal animal, @RequestParam("image") MultipartFile image) {
        if (!image.isEmpty()) {
            String imagePath = saveImage(image);
            animal.setImagePath(imagePath);
        }
        animalService.addNewAnimal(animal);
        return "redirect:/animals/all";
    }

    @GetMapping("/update/{id}")
    public String showUpdateForm(@PathVariable Integer id, Model model) {
        Animal animal = animalService.getAnimalById(id);
        model.addAttribute("animal", animal);
        model.addAttribute("title", "Update Animal - " + id);
        return "updateForm";
    }

    @PostMapping("/update/{id}")
    public String updateAnimal(@PathVariable Integer id, @ModelAttribute Animal animal, @RequestParam("image") MultipartFile image) {
        if (!image.isEmpty()) {
            String imagePath = saveImage(image);
            animal.setImagePath(imagePath);
        } else {
            Animal existingAnimal = animalService.getAnimalById(id);
            animal.setImagePath(existingAnimal.getImagePath());
        }
        animal.setAnimalId(id);
        animalService.updateAnimal(animal);
        return "redirect:/animals/all";
    }

    @GetMapping("/delete/{id}")
    public String deleteAnimal(@PathVariable Integer id) {
        animalService.deleteAnimal(id);
        return "redirect:/animals/all";
    }

    @GetMapping("/name")
    public String getAnimalsByName(@RequestParam String search, Model model) {
        List<Animal> animals = animalService.getAnimalsByName(search);
        model.addAttribute("animalList", animals);
        model.addAttribute("title", "Search Results for: " + search);
        return "list";
    }

    @GetMapping("/species/{species}")
    public String getAnimalsBySpecies(@PathVariable String species, Model model) {
        List<Animal> animals = animalService.getAnimalsBySpecies(species);
        model.addAttribute("animalList", animals);
        model.addAttribute("title", "Animals of Species: " + species);
        return "list";
    }

    private String saveImage(MultipartFile file) {
        try {
            Path uploadPath = Paths.get(uploadDir);
            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
            }

            String filename = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
            Path filePath = uploadPath.resolve(filename);

           
            Files.copy(file.getInputStream(), filePath);

           
            return "/uploads/" + filename;
        } catch (IOException e) {
            throw new RuntimeException("Could not save image file", e);
        }
    }
}