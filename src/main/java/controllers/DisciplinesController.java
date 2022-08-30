package controllers;

import db.DBManager;
import entety.Discipline;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "DisciplinesController", urlPatterns = "/disciplines")
public class DisciplinesController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DBManager manager = new DBManager();
        ArrayList<Discipline> disciplines = manager.getAllActiveDisciplines();
        req.setAttribute("disciplines", disciplines);
        req.getRequestDispatcher("WEB-INF/jsp/disciplines.jsp").forward(req, resp);
    }
}
