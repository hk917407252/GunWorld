package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import services.WeaponService;
@WebServlet("/weapon_deleteServlet")
public class Weapon_deleteServlet extends HttpServlet{

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		WeaponService ws = new WeaponService();
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String model = request.getParameter("model");
		boolean b = ws.deleteByModel(model);
		if(b){
			response.sendRedirect("weapon/Sucess.jsp");
		}
		else{
			response.sendRedirect("/errorPage/500.jsp");
		}
	}
	
}
