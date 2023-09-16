package com.Manager.servlets;

import com.Manager.Product.Product;
import com.Manager.db_connection.DB_ProductControl;
import com.Manager.util.photo.PhotoUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;

import static com.Manager.util.photo.PhotoUtil.storePhoto;

@MultipartConfig
@WebServlet("/product/*")
public class ProductInfoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        System.out.println("doGet getting: " + req.getRequestURI());
        getServletContext().getRequestDispatcher("/target/classes/Product Info/ProductInfoPage.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

        System.out.println("post " + req.getRequestURI());

        if(req.getRequestURI().endsWith(("delete"))) {
            String previousName = req.getParameter("prevname");
            DB_ProductControl.deleteProduct(previousName);
            resp.sendRedirect("/catalog");
            return;
        }

        String name = req.getParameter("name");
        String price = req.getParameter("price");
        String description = req.getParameter("description").trim();
        String photoStorePath = storePhoto(req);

        String content = name + price + description + photoStorePath;
        if(name.trim().equals("") || price.trim().equals("") || content.contains("'")) {
            //TODO: add error page
            resp.sendRedirect("/target/classes/Error Page/400ErrorPage.jsp");
            return;
        }

        Product product = new Product(name, price, description, photoStorePath);

        //adding new product
        if(req.getRequestURI().endsWith("new"))
            DB_ProductControl.addProduct(product);

        //updating already existing product
        else {
            String previousName = req.getParameter("prevname");
            DB_ProductControl.updateProduct(product, previousName);
        }
        resp.sendRedirect("/catalog");

    }

}
