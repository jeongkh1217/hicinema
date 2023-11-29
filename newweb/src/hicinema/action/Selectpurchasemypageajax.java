package hicinema.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hicinema.action.Action;
import hicinema.action.vo.ActionForward;
import hicinema.cart.Cartgetset;
import hicinema.store.Storegetset;
import hicinema.svc.*;

public class Selectpurchasemypageajax implements Action {
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String pid = request.getParameter("purchaseid");
        ArrayList<Cartgetset> cgs = new ArrayList<Cartgetset>();
        MypageselectService MsS = new MypageselectService();
        cgs = MsS.selectpurchasemypageajax(pid);
        ArrayList<String> itemIds = extractItemIds(cgs);
        request.setAttribute("purchaselist", cgs);
        ArrayList<Storegetset> sgs = new ArrayList<Storegetset>();
        sgs = MsS.selectitemnamemypageajax(itemIds);       
        request.setAttribute("itemnamelist", sgs); 
        ActionForward forward = new ActionForward();
        forward.setPath("/mypagepurchaseajax.jsp");
        return forward;
    }

    private ArrayList<String> extractItemIds(ArrayList<Cartgetset> cartList) {
        ArrayList<String> itemIds = new ArrayList<>();

        for (Cartgetset cart : cartList) {
            itemIds.add(cart.getItemid());
        }

        return itemIds;
    }
}