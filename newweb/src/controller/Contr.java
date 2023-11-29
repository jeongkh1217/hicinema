package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.ha.backend.Sender;

import com.mysql.fabric.Response;

public class Contr extends HttpServlet {

	@Override
	protected void service(HttpServletRequest rq, HttpServletResponse rs) throws ServletException, IOException {
		rq.setCharacterEncoding("UTF-8");
		rs.setContentType("text/html;charset=UTF-8");
		String comm = rq.getParameter("comm");
		

		Hicinemainterface in = null;
		Hicinemainterface in2 = null;
		Hicinemainterface in3 = null;
		Hicinemainterface in4 = null;
		Hicinemainterface in5 = null;
		Hicinemainterface in6 = null;
		Hicinemainterface in7 = null;

		try {
			if (comm.equals("selectmovie")) {
				String orderby = rq.getParameter("orderby");
				if (orderby.equals("totalview")) {
					in = SelectMovieTotalview.instan();
					String n = in.shData(rq, rs);
				} else if (orderby.equals("movietitle")) {
					in = SelectMovieMovietitle.instan();
					String n = in.shData(rq, rs);
				} else if (orderby.equals("releasedate")) {
					in = SelectMovieReleasedate.instan();
					String n = in.shData(rq, rs);
				} else if (orderby.equals("ratingvalue")) {
					in = SelectMovieRatingvalue.instan();
					String n = in.shData(rq, rs);
				}
				rq.setAttribute("orderby", orderby);
				RequestDispatcher dispatcher = rq.getRequestDispatcher("movie.jsp");
				dispatcher.forward(rq, rs);

			} else if (comm.equals("selectwheremovie")) {
				String nowPage = rq.getParameter("page");
				rq.setAttribute("page", nowPage);
				in = SelectwhereMovie.instan();
				String m= in.shData(rq, rs);
				in2 = SelectcountMovieLike.instan();
				String n=in2.shData(rq, rs);
				in3 = SelectSnC.instan();
				String l = in3.shData(rq, rs);
				in4 = SelecttotalviewMovie.instan();
				in5 = SelectavgwhereSnC.instan();
				in6 = SnCPaging.instan();
				String r = in6.shData(rq, rs);
				String q = in5.shData(rq, rs);				
				String o = in4.shData(rq, rs);				
				RequestDispatcher dispatcher = rq.getRequestDispatcher("moviedetail.jsp");
				dispatcher.forward(rq, rs);		
			
			} else if (comm.equals("selectcountsnc")) {
				in = SelectcountSnCLike.instan();
				String n = in.shData(rq, rs);
				RequestDispatcher dispatcher = rq.getRequestDispatcher("forsnclikeselectajax.jsp");
				dispatcher.forward(rq, rs);			
			
			} else if (comm.equals("updatemovieratingvalue")) {
				in = UpdateMovierating.instan();
				String n = in.shData(rq, rs);

			} else if (comm.equals("insertmovie")) {
				in = InsertMovie.instan();
				String n = in.shData(rq, rs);
				
			}else if (comm.equals("checksnc")) {
				in=CheckSnC.instan();
				String q = in.shData(rq, rs);				
				RequestDispatcher dispatcher = rq.getRequestDispatcher("forsnccheckajax.jsp");
				dispatcher.forward(rq, rs);
			
			} else if (comm.equals("checkidsnclike")) {
				in=CheckIDSnCLike.instan();
				String n = in.shData(rq,rs);
				
				RequestDispatcher dispatcher = rq.getRequestDispatcher("forsnclikecheckajax.jsp");
				dispatcher.forward(rq, rs);
			} else if (comm.equals("insertidsnclike")) {
				in=InsertIDSnCLike.instan();
				String n = in.shData(rq,rs);

			} else if (comm.equals("updatesncplus")) {
				in=UpdateSnCPlus.instan();
				String n = in.shData(rq,rs);

			} else if (comm.equals("deleteidsnclike")) {
				in=DeleteIDSnCLike.instan();
				String n = in.shData(rq, rs);
				
			} else if (comm.equals("updatesncminus")) {
				in=UpdateSnCMinus.instan();
				String n = in.shData(rq,rs);
			
			} else if (comm.equals("selecttheater")) {
				in=SelectTheater.instan();
				String n= in.shData(rq, rs);
				in2=SelectMovieTotalview.instan();
				String m= in2.shData(rq, rs);
				RequestDispatcher dispatcher = rq.getRequestDispatcher("movieschedule.jsp");
				dispatcher.forward(rq, rs);	

			}else if (comm.equals("selectwheretheater")) {
				in=SelectwhereTheater.instan();
				String n=in.shData(rq, rs);
				RequestDispatcher dispatcher = rq.getRequestDispatcher("moviescheduleselectwheretheaterajax.jsp");
				dispatcher.forward(rq,rs);
				
			}else if (comm.equals("selecttimewheretheater")) {
				in=SelecttimewhereTheater.instan();
				String n = in.shData(rq, rs);
				RequestDispatcher dispatcher = rq.getRequestDispatcher("moviescheduleselecttimewheretheaterajax.jsp");
				dispatcher.forward(rq, rs);
			
			}else if (comm.equals("selectleftseatwhere")) {
				in=Selectleftseatwhere.instan();
				String n= in.shData(rq, rs);
				RequestDispatcher dispatcher = rq.getRequestDispatcher("moviescheduleleftseatajax.jsp");
				dispatcher.forward(rq, rs);
				
			
			} else {
				System.out.println("좀잘해봐임마");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}