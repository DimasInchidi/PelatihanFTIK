package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

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
        String URL = "/";
        String ID = request.getParameter("ID");
        String Nama = request.getParameter("Nama");
        String NIM = request.getParameter("NIM");
        String HP = request.getParameter("HP");
        String IDE = request.getParameter("IDE");
        String Testi = request.getParameter("Testi");
        switch (IDE){
            case "Intellij":

                break;
            case "Netbeans":

                break;
            case "Eclipse":

                break;
            case "Text Editor (such as: notepad/gedit, Sublime, etc)":
                IDE = "Text Editor";
                break;
            default:
                IDE = "Intellij";
                break;
        }
        F_Koneksi koneksi = new F_Koneksi();
        try {
            int nim = Integer.parseInt(NIM);
            String query = "INSERT INTO public.datauser (userid, nama, nim, hp, ide, testi) " +
                    "VALUES ('" + ID +
                    "', '" + Nama + "', '" +
                    nim +
                    "', '" + HP +
                    "', '" + IDE +
                    "', '" + Testi + "');";
            if (koneksi.Insert(query)){
                URL = "/Thanks";
            } else {
                request.getSession().setAttribute("fail","insert");
            }
        } catch (Exception e){
            request.getSession().setAttribute("fail","param");
        }
        response.sendRedirect(URL);
    }
}
