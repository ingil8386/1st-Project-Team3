package DTO;

public class CommentDTO {

    private int commentno;
    private int commno;
    private String content;
    private String writer;
    private String regip;
    private String wdate;

    // member 조인 출력용
    private String membernick;

    public int getCommentno() {
        return commentno;
    }

    public void setCommentno(int commentno) {
        this.commentno = commentno;
    }

    public int getCommno() {
        return commno;
    }

    public void setCommno(int commno) {
        this.commno = commno;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
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