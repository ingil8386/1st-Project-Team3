package DTO;

public class CartDTO {

    private int cartno;
    private String memberid;
    private int productno;
    private int cartcount;
    private String rdate;

    // product 조인 출력용
    private String productcate;
    private String productname;
    private int productprice;
    private String productimg;
    private int productstock;

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

    public int getProductno() {
        return productno;
    }

    public void setProductno(int productno) {
        this.productno = productno;
    }

    public int getCartcount() {
        return cartcount;
    }

    public void setCartcount(int cartcount) {
        this.cartcount = cartcount;
    }

    public String getRdate() {
        return rdate;
    }

    public void setRdate(String rdate) {
        this.rdate = rdate;
    }

    public String getProductcate() {
        return productcate;
    }

    public void setProductcate(String productcate) {
        this.productcate = productcate;
    }

    public String getProductname() {
        return productname;
    }

    public void setProductname(String productname) {
        this.productname = productname;
    }

    public int getProductprice() {
        return productprice;
    }

    public void setProductprice(int productprice) {
        this.productprice = productprice;
    }

    public String getProductimg() {
        return productimg;
    }

    public void setProductimg(String productimg) {
        this.productimg = productimg;
    }

    public int getProductstock() {
        return productstock;
    }

    public void setProductstock(int productstock) {
        this.productstock = productstock;
    }

    public int getTotal() {
        return productprice * cartcount;
    }
}