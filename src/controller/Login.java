package controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.LoginService;

import database.Insert;
import database.Select;
import database.Update;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	database.Insert in ;	database.Select sa; Update up; LoginService Ls;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		in = new Insert(); sa= new Select(); up = new Update();Ls = new LoginService();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("Text/HTML");
		PrintWriter pw = response.getWriter();boolean h = false;
		HttpSession session = request.getSession();
		String showmsg=null;String SHOPID ="";
		try {
			ResultSet rs=null;
		rs=Ls.getLoginDetail("shopkeeperregistration", request.getParameter("ContactNumber1"),  request.getParameter("password"));
	
			if(rs.next()){
				session.setAttribute("shopname", rs.getString(4));
				session.setAttribute("shopid", rs.getString(2));
				pw.println(rs.getString(2));
			}else{
				pw.println("No match found");
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}

}
