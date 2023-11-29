package hicinema.action;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import hicinema.action.vo.ActionForward;
import hicinema.community.vo.Communitygetset;
import hicinema.svc.CommunityinsertService;

public class InsertCommunity implements Action {

    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ActionForward forward = null;
        Communitygetset Cgs = null;
        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String dateString = dateFormat.format(date);
        String realFolder = "";
        String saveFolder = "/boardUpload";
        int fileSize = 30 * 1024 * 1024;
        ServletContext context = request.getServletContext();
        realFolder = context.getRealPath(saveFolder);
        try {
            MultipartRequest multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8",
                    new DefaultFileRenamePolicy());
            Cgs = new Communitygetset();
            Cgs.setId(multi.getParameter("id"));
            Cgs.setPosttitle(multi.getParameter("posttitle"));
            Cgs.setPost(multi.getParameter("post"));
            Cgs.setTab(multi.getParameter("tab"));
            Cgs.setWrittendate(dateString);
            for (int i = 1; i <= 5; i++) {
                String paramName = "file" + i;
                if (multi.getFile(paramName) != null) {
                    Cgs.setFile(paramName, multi.getOriginalFileName(paramName));
                }
            }
            CommunityinsertService CiS = new CommunityinsertService();
            boolean isWriteSuccess = CiS.InsertCommunity(Cgs);
            if (!isWriteSuccess) {
                response.setContentType("text/html;charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.println("<script>");
                out.println("alert('fail')");
                out.println("history.back();");
                out.println("</script>");
            } else {
                forward = new ActionForward();
                forward.setRedirect(true);
                forward.setPath("community.hci?orderby=postno&tab=all");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return forward;
    }

}
