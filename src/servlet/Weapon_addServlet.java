package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import services.WeaponService;

/**
 * Servlet implementation class Weapon_addServlet
 */
@WebServlet("/weapon_addServlet")
public class Weapon_addServlet extends HttpServlet {
	/**
     * @see HttpServlet#HttpServlet()
     */
    public Weapon_addServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
       
    
    @Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		WeaponService sfr = new WeaponService();
		String model = request.getParameter("model").toString();
		String name = request.getParameter("name").toString();
		String caliber = request.getParameter("caliber").toString();
		String type = request.getParameter("type").toString();
		String variety = request.getParameter("variety").toString();
		String detail = request.getParameter("detail").toString();
		String route = request.getParameter("route").toString();
		boolean result = sfr.insert(model,name,caliber,type,variety,detail,route);
		if(result){
			response.sendRedirect("weapon/Sucess.jsp");
		}
		else{
			request.setAttribute("error_input", "输入信息非法");
        	request.getRequestDispatcher("weapon/Sucess.jsp").forward(request , response );
		}
	}


}
