package servlet;

/**
 * Created by inchidi on 05/12/15.
 */
public class O_Peserta {
    private String ID;
    private String Nama;
    private String NIM;
    private String HP;
    private String IDE;
    private String Testi;

    public String getTesti() {
        return Testi;
    }

    public void setTesti(String testi) {
        Testi = testi;
    }

    public String getIDE() {
        return IDE;
    }

    public void setIDE(String IDE) {
        this.IDE = IDE;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getNama() {
        return Nama;
    }

    public void setNama(String nama) {
        Nama = nama;
    }

    public String getNIM() {
        return NIM;
    }

    public void setNIM(String NIM) {
        this.NIM = NIM;
    }

    public String getHP() {
        return HP;
    }

    public void setHP(String HP) {
        this.HP = HP;
    }
}
