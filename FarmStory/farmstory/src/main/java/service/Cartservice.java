package service;

import java.util.List;
import DAO.CartDAO;
import DTO.CartDTO;

public enum Cartservice {

    INSTANCE;

    private final CartDAO cartDAO = CartDAO.getInstance();

    // 장바구니 목록 조회
    public List<CartDTO> getCartList(String memberid) {
        return cartDAO.selectCartList(memberid);
    }

    // 장바구니 추가 (중복이면 수량/날짜 자동 업데이트)
    public void addCart(CartDTO dto) {
        cartDAO.insertCart(dto);
    }

    // 장바구니 수량 수정
    public void modifyCart(CartDTO dto) {
        cartDAO.updateCart(dto);
    }

    // 장바구니 삭제
    public void removeCart(int cartno) {
        cartDAO.deleteCart(cartno);
    }
}