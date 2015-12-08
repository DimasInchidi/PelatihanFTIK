package servlet;

import javax.management.Query;
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
        response.sendRedirect("/");
    }

    private void aksi(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String URL = "/fail";
        Map dataDaftar = request.getParameterMap();
        F_Koneksi koneksi = new F_Koneksi();
        try {
            String query = "INSERT INTO public.datauser (userid, nama, nim, hp, ide, testi) " +
                    "VALUES (" + Integer.parseInt(dataDaftar.get("ID").toString()) +
                    ", '" + dataDaftar.get("Nama").toString() + "', " +
                    Integer.parseInt(dataDaftar.get("NIM").toString()) +
                    ", " + Integer.parseInt(dataDaftar.get("HP").toString()) +
                    ", '" + dataDaftar.get("IDE").toString() +
                    "', '" + dataDaftar.get("Testi").toString() + "');";
            System.out.println(query);
            if (koneksi.Insert(query)){
                URL = "/done";
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        response.sendRedirect(URL);
    }
}