package DTO;

public class EventDTO {

    private int eventno;
    private String title;
    private String startdate;
    private String rdate;

    public int getEventno() {
        return eventno;
    }

    public void setEventno(int eventno) {
        this.eventno = eventno;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getStartdate() {
        return startdate;
    }

    public void setStartdate(String startdate) {
        this.startdate = startdate;
    }

    public String getRdate() {
        return rdate;
    }

    public void setRdate(String rdate) {
        this.rdate = rdate;
    }
}