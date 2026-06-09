package DTO;

public class CommunityDTO {

    private int commno;
    private int boardno;
    private String title;
    private String content;
    private int commentcount;
    private int filecheck;
    private int hit;
    private String writer;
    private String regip;
    private String wdate;

    // member 조인 출력용
    private String membernick;

    public int getCommno() {
        return commno;
    }

    public void setCommno(int commno) {
        this.commno = commno;
    }

    public int getBoardno() {
        return boardno;
    }

    public void setBoardno(int boardno) {
        this.boardno = boardno;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
    
    public int getCommentcount() {
        return commentcount;
    }

    public void setCommentcount(int commentcount) {
        this.commentcount = commentcount;
    }

    public int getFilecheck() {
        return filecheck;
    }

    public void setFilecheck(int filecheck) {
        this.filecheck = filecheck;
    }

    public int getHit() {
        return hit;
    }

    public void setHit(int hit) {
        this.hit = hit;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public String getRegip() {
        return regip;
    }

    public void setRegip(String regip) {
        this.regip = regip;
    }

    public String getWdate() {
        return wdate;
    }

    public void setWdate(String wdate) {
        this.wdate = wdate;
    }

    public String getMembernick() {
        return membernick;
    }

    public void setMembernick(String membernick) {
        this.membernick = membernick;
    }
}