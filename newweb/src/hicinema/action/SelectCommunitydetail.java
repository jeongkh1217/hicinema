package hicinema.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hicinema.action.vo.ActionForward;
import hicinema.community.vo.Communitycombinedgetset;
import hicinema.community.vo.Communitygetset;
import hicinema.community.vo.Communitypagegetset;
import hicinema.communityreply.vo.Communityreplypagegetset;
import hicinema.member.vo.Membergetset;
import hicinema.movie.vo.Moviegetset;
import hicinema.movielike.vo.Movielikegetset;
import hicinema.reservation.vo.Reservationgetset;
import hicinema.snc.vo.SnCgetset;
import hicinema.store.Storegetset;
import hicinema.storelike.vo.StoreLikegetset;
import hicinema.svc.CommunityreplycountService;
import hicinema.svc.CommunityselectService;
import hicinema.svc.MypageselectService;

import java.util.ArrayList;

public class SelectCommunitydetail implements Action {
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int postno = Integer.parseInt(request.getParameter("postno"));
	  	int replypage=1;
		int replylimit=10;
		
		if(request.getParameter("page")!=null){
			replypage=Integer.parseInt(request.getParameter("page"));
		}  		
		CommunityreplycountService CrcS= new CommunityreplycountService();
		int replylistCount=CrcS.communityreplycount(postno);		
   		int replymaxPage=(int)((double)replylistCount/replylimit+0.95); 
   		int replystartPage = (((int) ((double)replypage / 10 + 0.9)) - 1) * 10 + 1;
   	    int replyendPage = replystartPage+10-1;

   		if (replyendPage> replymaxPage) replyendPage= replymaxPage;

   		Communityreplypagegetset Crpgs = new Communityreplypagegetset();
   		Crpgs.setReplyendPage(replyendPage);
   		Crpgs.setReplypostCount(replylistCount);
		Crpgs.setReplymaxPage(replymaxPage);
		Crpgs.setReplypage(replypage);
		Crpgs.setReplystartPage(replystartPage);	
		request.setAttribute("PageInfo", Crpgs);        
        ArrayList<Communitycombinedgetset> Ccgs = new ArrayList<>();
        CommunityselectService CsS = new CommunityselectService();
        Ccgs = CsS.selectcommunitydetail(postno,replypage,replylimit);
        request.setAttribute("Boardinfo", Ccgs);
        ActionForward forward = new ActionForward();
        forward.setPath("/communityboarddetail.jsp");
        return forward;
    }
}