package com.Manager.util.photo;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;

public class PhotoUtil {
    public static String storePhoto(HttpServletRequest req) {
        try {
            Part part = req.getPart("photo");
            File storage = new File("Your PATH\\aplik\\IdeaProjects\\Manager\\src\\main\\resources\\Product images\\" + part.getSubmittedFileName());
            if(!part.getSubmittedFileName().equals("")) {
                part.write(storage.getAbsolutePath());
                return storage.getAbsolutePath();
            }
            else
                return null;
        } catch (IOException | ServletException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static void deletePhoto(String image_path) {
        System.out.println("Deleting image: " + image_path);
        File image = new File(image_path);
        image.delete();
    }

}
