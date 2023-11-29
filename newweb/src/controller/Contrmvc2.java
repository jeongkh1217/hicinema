package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hicinema.dao.*;
import hicinema.action.Action;
import hicinema.action.Communitydownload;
import hicinema.action.Communitysearch;
import hicinema.action.DeleteCommunity;
import hicinema.action.DeleteCommunityreply;
import hicinema.action.DeletePurchase;
import hicinema.action.DeleteReservation;
import hicinema.action.InsertCommunity;
import hicinema.action.InsertCommunityreply;
import hicinema.action.SelectMovielist;
import hicinema.action.SelectSeat;
import hicinema.action.Selectmypage;
import hicinema.action.Selectpurchasemypageajax;
import hicinema.action.Selectreservationmypageajax;
import hicinema.action.UpdateCommunity;
import hicinema.action.UpdateCommunityreply;
import hicinema.action.InsertReservation;
import hicinema.action.InsertpreReservation;
import hicinema.action.PreInsertCommunity;
import hicinema.action.SelectCommunity;
import hicinema.action.SelectCommunitydetail;
import hicinema.action.vo.ActionForward;

public class Contrmvc2 extends javax.servlet.http.HttpServlet 
{
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String RequestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=RequestURI.substring(contextPath.length());
		ActionForward forward=null;
		Action action=null;
		
		if (command.equals("/moviescheduleseat.hci")) {
			action = new SelectMovielist();			
			forward=new ActionForward();		
			try {
				forward=action.execute(request, response);				
			} catch(Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/moviescheduleseat2.hci")) {
			action = new SelectSeat();
			forward = new ActionForward();
			try {
				forward = action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}		
		
		} else if(command.equals("/movieschedulereservation.hci")) {			
			action = new InsertReservation();
			try {
				forward=action.execute(request, response);				
			} catch(Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/moviepaymentconfirm.hci")) {
			action = new InsertpreReservation();
			try {
				forward=action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/mypage.hci")) {
			action = new Selectmypage();
			try {
				forward=action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/mpagereservationajax.hci")) {
			action = new Selectreservationmypageajax();
			try {
				forward=action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/mpagepurchaseajax.hci")) {
			action = new Selectpurchasemypageajax();
			try {
				forward=action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/cancelreservation.hci")) {
			action = new DeleteReservation();
			try {
				forward=action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/cancelpurchase.hci")) {
			action = new DeletePurchase();
			try {
				forward=action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/community.hci")) {			
			action = new SelectCommunity();
			try {
				forward=action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/communitywrite.hci")) {
			action = new PreInsertCommunity();
			try {
				forward=action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/boardinsert.hci")) {
			action = new InsertCommunity();	
			try {
				forward=action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/communityboarddetail.hci")) {
			action = new SelectCommunitydetail();
			try {
				forward=action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/communityreply.hci")) {
			action = new InsertCommunityreply();
			try {
			forward=action.execute(request, response);
		} catch(Exception e) {
			e.printStackTrace();
		} 
			
		} else if(command.equals("/communityupdate.hci")) {
			action=new UpdateCommunity();
			try {
				forward=action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/communitydelete.hci")) {
			action=new DeleteCommunity();
			try {
				forward=action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/communityreplyupdate.hci")) {
			action=new UpdateCommunityreply();
			try {
				forward=action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/communityreplydelete.hci")) {
			action=new DeleteCommunityreply();
			try {
				forward=action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/communityfiledown.hci")) {
			action=new Communitydownload();
			try {
				forward=action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/communitysearch.hci")) {
			action=new Communitysearch();
			try {
				forward=action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
		if(forward != null){
			
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());
			}else{
				RequestDispatcher dispatcher=
						request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}			
		}		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request,response);
	}  	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request,response);
	}   
	
}