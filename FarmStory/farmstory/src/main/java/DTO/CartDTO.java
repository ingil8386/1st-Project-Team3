package DTO;

public class CartDTO {

    private int cartno;
    private String memberid;
    private String membername;
    private int productno;
    private String productname;
    private String productcate;
    private int productprice;
    private int cartcount;
    private int totalprice;
    private String rdate;

    public int getCartno() {
        return cartno;
    }

    public void setCartno(int cartno) {
        this.cartno = cartno;
    }

    public String getMemberid() {
        return memberid;
    }

    public void setMemberid(String memberid) {
        this.memberid = memberid;
    }

    public String getMembername() {
        return membername;
    }

    public void setMembername(String membername) {
        this.membername = membername;
    }

    public int getProductno() {
        return productno;
    }

    public void setProductno(int productno) {
        this.productno = productno;
    }

    public String getProductname() {
        return productname;
    }

    public void setProductname(String productname) {
        this.productname = productname;
    }

    public String getProductcate() {
        return productcate;
    }

    public void setProductcate(String productcate) {
        this.productcate = productcate;
    }

    public int getProductprice() {
        return productprice;
    }

    public void setProductprice(int productprice) {
        this.productprice = productprice;
    }

    public int getCartcount() {
        return cartcount;
    }

    public void setCartcount(int cartcount) {
        this.cartcount = cartcount;
    }

    public int getTotalprice() {
        return totalprice;
    }

    public void setTotalprice(int totalprice) {
        this.totalprice = totalprice;
    }

    public String getRdate() {
        return rdate;
    }

    public void setRdate(String rdate) {
        this.rdate = rdate;
    }
}