package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import services.WeaponService;

/**
 * Servlet implementation class Weapon_updateServlet
 */
@WebServlet("/weapon_updateServlet")
public class Weapon_updateServlet extends HttpServlet {
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Weapon_updateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		WeaponService sfr = new WeaponService();
		String model = request.getSession().getAttribute("model").toString();
		String name = request.getParameter("name");
		String caliber = request.getParameter("caliber");
		String type = request.getParameter("type");
		String variety = request.getParameter("variety");
		String detail = request.getParameter("detail");
		String route = request.getParameter("route");
		boolean result = sfr.update(model,name,caliber,type,variety,detail,route);
		if(result){
			response.sendRedirect("weapon/Sucess.jsp");
		}
		else{
			request.setAttribute("error_input", "输入信息非法");
        	request.getRequestDispatcher("weapon/update_weapon.jsp").forward(request , response );
		}
	}

	

}
