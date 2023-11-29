package hicinema.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hicinema.action.vo.ActionForward;
import hicinema.cart.Cartgetset;
import hicinema.community.vo.Communitygetset;
import hicinema.communitylike.vo.Communitylikegetset;
import hicinema.member.vo.Membergetset;
import hicinema.movie.vo.Moviegetset;
import hicinema.movielike.vo.Movielikegetset;
import hicinema.reservation.vo.Reservationgetset;
import hicinema.snc.vo.SnCgetset;
import hicinema.store.Storegetset;
import hicinema.storelike.vo.StoreLikegetset;
import hicinema.svc.MypageselectService;

import java.util.ArrayList;

public class Selectmypage implements Action {
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String id = request.getParameter("id");
        ArrayList<Reservationgetset> rgs = new ArrayList<>();
        MypageselectService MsS = new MypageselectService();
        rgs = MsS.selectmypageseat(id);
        request.setAttribute("reservationlist", rgs);
        ArrayList<Cartgetset> cgs = new ArrayList<>();
        cgs = MsS.selectmypagepurchase(id);
        request.setAttribute("purchaselist", cgs);
        ArrayList<SnCgetset> Sgs = new ArrayList<>();
        Sgs = MsS.selectmypageSnC(id);
        request.setAttribute("snclist", Sgs);
        ArrayList<String> movieIds = extractMovieIds(Sgs);
        ArrayList<Moviegetset> mgs = new ArrayList<>();
        mgs = MsS.selectmypagemovie(movieIds);
        request.setAttribute("movielist", mgs);        
        ArrayList<StoreLikegetset> slgs = new ArrayList<>();
        slgs = MsS.selectmypagestorelike(id);
        request.setAttribute("storelikelist", slgs);        
        ArrayList<String> itemIds = extractItemIds(slgs);
        ArrayList<Storegetset> sgs = new ArrayList<Storegetset>();
        sgs = MsS.selectitemnamemypageajax(itemIds);
        request.setAttribute("itemnamelist", sgs);                
        ArrayList<Movielikegetset> mlgs = new ArrayList<>();
        mlgs = MsS.selectmypagemovielike(id);
        request.setAttribute("movielikelist", mlgs);        
        ArrayList<String> movieIds2 = extractMovieIds2(mlgs);
        ArrayList<Moviegetset> mgs2 = new ArrayList<>();
        mgs2 = MsS.selectmypagemovie(movieIds2);
        request.setAttribute("movieliketitlelist", mgs2);        
        ArrayList<Membergetset> mgs3 = new ArrayList<>();
        mgs3 = MsS.selectmypagemember(id);
        request.setAttribute("memberdetaillist",mgs3);        
        ArrayList<Communitygetset> cgs2 = new ArrayList<>();
        cgs2 = MsS.selectmypagecommunity(id);
        request.setAttribute("communitylist", cgs2);        
        ArrayList<Communitylikegetset> cgs3 = new ArrayList<>();
        cgs3 = MsS.selectmypagecommunitylike(id);
        ArrayList<Integer> postNoList = new ArrayList<>();
        for (Communitylikegetset cgs4 : cgs3) {
            try {
                int postNo = cgs4.getPostno();
                postNoList.add(postNo);
            } catch (NumberFormatException e) {                
            }
        }
        ArrayList<Communitygetset> cgs5 = new ArrayList<>();
        cgs5 = MsS.selectmypagecommunitylikereal(postNoList);
        request.setAttribute("communitylikelist", cgs5);

        

        ActionForward forward = new ActionForward();
        forward.setPath("/mypage.jsp");
        return forward;
    }

    private ArrayList<String> extractMovieIds(ArrayList<SnCgetset> sgsList) {
        ArrayList<String> movieIds = new ArrayList<>();
        for (SnCgetset sgsItem : sgsList) {
            movieIds.add(sgsItem.getMovieid());
        }
        return movieIds;
    }
    
    private ArrayList<String> extractMovieIds2(ArrayList<Movielikegetset> MlList) {
        ArrayList<String> movieIds = new ArrayList<>();
        for (Movielikegetset MlItem : MlList) {
            movieIds.add(MlItem.getMovieid());
        }
        return movieIds;
    }
    

    private ArrayList<String> extractItemIds(ArrayList<StoreLikegetset> slgsList) {
        ArrayList<String> itemIds = new ArrayList<>();
        for (StoreLikegetset slgsItem : slgsList) {
            itemIds.add(slgsItem.getItemid());
        }
        return itemIds;
    }
    
}