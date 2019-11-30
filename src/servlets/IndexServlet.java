package servlets;
import databeans.*;
import index.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 * Servlet implementation class IndexServlet
 */
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IndexServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.print("enter IndexServlet\n");
		if(request.getParameter("cmd").equals("transGameInfo")) {
			System.out.print("enter tranGameInfo in servlet\n");
			HttpSession session=request.getSession();
			int index=Integer.parseInt(request.getParameter("index"));
			System.out.print("get index="+index+"\n");
			GameList gameList=(GameList)session.getAttribute("GameList");
			GameInfo gameInfo=gameList.getGameItem(index);
			session.setAttribute("gameInfo", gameInfo);
			//System.out.print("get gameName="+((GameInfo)session.getAttribute("gameInfo")).getName()+"\n");
		}
		else
		{
			System.out.print("fail to enter tranGameInfo in servlet\n");
			System.out.print("cmd="+request.getParameter("cmd")+"\n");
		}
		response.getWriter().print("transGameInfo");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
