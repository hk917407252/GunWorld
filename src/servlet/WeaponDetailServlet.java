package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Weapon;
import services.WeaponService;

/**
 * Servlet implementation class Weapon_detail
 */
@WebServlet("/weapon_detail_servlet")
public class WeaponDetailServlet extends HttpServlet {
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WeaponDetailServlet() {
        super();
    }

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		WeaponService ws = new WeaponService();
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("utf-8");
		Weapon weapon =null;
		weapon = ws.loadByModel(request.getParameter("model"));
		if(weapon!=null) {
			//保存数据到session,重定向到详情页面
			request.getSession().setAttribute("weapon", weapon);
			response.sendRedirect("weapon/weapon_detail.jsp");
		}
		else {
			response.sendRedirect("/errorPage/500.jsp");
		}
	}
    
    
}
