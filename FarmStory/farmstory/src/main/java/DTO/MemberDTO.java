package DTO;

public class MemberDTO {

    private String memberid;
    private String memberpass;
    private String membername;
    private String membernick;
    private String memberemail;
    private String memberhp;
    private String memberrole;
    private String memberzip;
    private String memberaddr1;
    private String memberaddr2;
    private String regip;
    private String rdate;
    private String leavedate;

    public String getMemberid() {
        return memberid;
    }

    public void setMemberid(String memberid) {
        this.memberid = memberid;
    }

    public String getMemberpass() {
        return memberpass;
    }

    public void setMemberpass(String memberpass) {
        this.memberpass = memberpass;
    }

    public String getMembername() {
        return membername;
    }

    public void setMembername(String membername) {
        this.membername = membername;
    }

    public String getMembernick() {
        return membernick;
    }

    public void setMembernick(String membernick) {
        this.membernick = membernick;
    }

    public String getMemberemail() {
        return memberemail;
    }

    public void setMemberemail(String memberemail) {
        this.memberemail = memberemail;
    }

    public String getMemberhp() {
        return memberhp;
    }

    public void setMemberhp(String memberhp) {
        this.memberhp = memberhp;
    }

    public String getMemberrole() {
        return memberrole;
    }

    public void setMemberrole(String memberrole) {
        this.memberrole = memberrole;
    }

    public String getMemberzip() {
        return memberzip;
    }

    public void setMemberzip(String memberzip) {
        this.memberzip = memberzip;
    }

    public String getMemberaddr1() {
        return memberaddr1;
    }

    public void setMemberaddr1(String memberaddr1) {
        this.memberaddr1 = memberaddr1;
    }

    public String getMemberaddr2() {
        return memberaddr2;
    }

    public void setMemberaddr2(String memberaddr2) {
        this.memberaddr2 = memberaddr2;
    }

    public String getRegip() {
        return regip;
    }

    public void setRegip(String regip) {
        this.regip = regip;
    }

    public String getRdate() {
        return rdate;
    }

    public void setRdate(String rdate) {
        this.rdate = rdate;
    }

    public String getLeavedate() {
        return leavedate;
    }

    public void setLeavedate(String leavedate) {
        this.leavedate = leavedate;
    }

	@Override
	public String toString() {
		return "MemberDTO [memberid=" + memberid + ", memberpass=" + memberpass + ", membername=" + membername
				+ ", membernick=" + membernick + ", memberemail=" + memberemail + ", memberhp=" + memberhp
				+ ", memberrole=" + memberrole + ", memberzip=" + memberzip + ", memberaddr1=" + memberaddr1
				+ ", memberaddr2=" + memberaddr2 + ", regip=" + regip + ", rdate=" + rdate + ", leavedate=" + leavedate
				+ "]";
	}
    
}