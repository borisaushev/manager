package com.Manager.Product;

import com.Manager.db_connection.DB_Connection;
import com.Manager.db_connection.DB_ProductControl;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Base64;

public class Product {
    private final String name;
    private final String price;
    private String description;
    private String image_path;


    public Product(String name, String price) {
        this.name = name;
        this.price = price;
    }

    public Product(String name, String price, String description, String image_path) {
        this.name = name;
        this.price = price;
        if (description != null)
            this.description = description;
        if (image_path != null)
            this.image_path = image_path;
    }


    public String getEncodedPhoto() {
        String encodedPhoto = null;
        try {
            String path = image_path == null ? "C:\\Users\\aplik\\IdeaProjects\\Manager\\src\\main\\resources\\Product Info\\DEFAULTIMAGE.png" : image_path;
            byte[] fileContent = Files.readAllBytes(Path.of(path));
            String encodedString = Base64.getEncoder().encodeToString(fileContent);
            encodedPhoto = "<img class=\"product-image\" src='data:image/png;base64," + encodedString + "' alt=\"Фото товара\">";
        } catch (IOException e) {
            System.err.println("Error reading file: " + e);

            image_path = null;
            DB_ProductControl.updateProduct(this, name);

            String path = "C:\\Users\\aplik\\IdeaProjects\\Manager\\src\\main\\resources\\Product Info\\DEFAULTIMAGE.png";
            byte[] fileContent = new byte[0];
            try {fileContent = Files.readAllBytes(Path.of(path));} catch (IOException ex) { ex.printStackTrace(); }
            String encodedString = Base64.getEncoder().encodeToString(fileContent);
            encodedPhoto = "<img class=\"product-image\" src='data:image/png;base64," + encodedString + "' alt=\"Фото товара\">";

        }
        return encodedPhoto;
    }

    public String getName() {
        return name;
    }

    public String getPrice() { return price; }

    public String getDescription() {
        return description;
    }

    public String getImage_path() {
        return image_path;
    }

    @Override
    public String toString() {
        return "Product{" +
                "name='" + name + '\'' +
                "price='" + price + '\'' +
                ", description='" + description + '\'' +
                ", image_path='" + image_path + '\'' +
                '}';
    }
}
