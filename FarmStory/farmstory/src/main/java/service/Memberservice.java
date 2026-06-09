package service;

import DAO.MemberDAO;
import DTO.MemberDTO;

public enum Memberservice {

	INSTANCE;
    

    private MemberDAO dao = MemberDAO.getInstance();

    private Memberservice() {}

    public MemberDTO login(String memberid, String memberpass) {

        if (memberid == null || memberid.trim().isEmpty()) {
            return null;
        }

        if (memberpass == null || memberpass.trim().isEmpty()) {
            return null;
        }

        return dao.selectMember(memberid.trim(), memberpass);
    }
}