package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet(name = "Daftar",
urlPatterns = "/Daftar")
public class Daftar extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        aksi(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        aksi(request,response);
    }

    private void aksi(HttpServletRequest request, HttpServletResponse response) {
        Map dataDaftar = request.getParameterMap();
        dataDaftar.get("ID");
        dataDaftar.get("Nama");
        dataDaftar.get("NIM");
        dataDaftar.get("HP");
        dataDaftar.get("IDE");
        dataDaftar.get("Testi");


    }
}
