package DTO;

public class FileDTO {

    private int fileno;
    private int commno;
    private String ofname;
    private String sfname;
    private int download;
    private String rdate;

    public int getFileno() {
        return fileno;
    }

    public void setFileno(int fileno) {
        this.fileno = fileno;
    }

    public int getCommno() {
        return commno;
    }

    public void setCommno(int commno) {
        this.commno = commno;
    }

    public String getOfname() {
        return ofname;
    }

    public void setOfname(String ofname) {
        this.ofname = ofname;
    }

    public String getSfname() {
        return sfname;
    }

    public void setSfname(String sfname) {
        this.sfname = sfname;
    }

    public int getDownload() {
        return download;
    }

    public void setDownload(int download) {
        this.download = download;
    }

    public String getRdate() {
        return rdate;
    }

    public void setRdate(String rdate) {
        this.rdate = rdate;
    }
}