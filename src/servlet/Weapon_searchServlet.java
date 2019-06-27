package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Weapon;
import services.WeaponService;

/**
 * Servlet implementation class Weapon_searchServlet
 */
@WebServlet("/weapon_searchServlet")
public class Weapon_searchServlet extends HttpServlet {
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Weapon_searchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		WeaponService ws = new WeaponService();
		int current_page,page_num,page_size=15;
		String input;
		//初始化输入关键字的值
		if(request.getParameter("keyword")!=null) {
			input = request.getParameter("keyword").toString();
			request.getSession().setAttribute("input", input);
		}else {
			input = request.getSession().getAttribute("input").toString();
		}
		//获取根据关键字查询获得的武器信息数目
		int count = ws.loadByInputNumber(input);
		
		//初始化获取页面数
		if(count%page_size!=0) {
			page_num = count/page_size +1;
		}else {
			page_num = count/page_size;
		}
		//获取当前的是哪个页面
		if(request.getParameter("current_page")!=null) {
			current_page = Integer.parseInt(request.getParameter("current_page").toString());
		}else {
			current_page =1;
		}
		//获取当前页面的武器数据
		List<Weapon> weaponList = ws.loadByInput(input,current_page);
		
		//结果处理
		if(weaponList == null){
			request.getRequestDispatcher("index.jsp").forward(request , response );
		}else{
			request.getSession().setAttribute("count", count);
			request.getSession().setAttribute("current_page", current_page);
			request.getSession().setAttribute("page_num", page_num);
			request.getSession().setAttribute("weaponList", weaponList);
			response.sendRedirect("weapon/display.jsp");
		}
	}
}
