package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.Select;
import database.Insert;
import database.Update;



/**
 * Servlet implementation class ShopKeeperRegistrationController
 */
@WebServlet("/ShopKeeperRegistrationController")
public class ShopKeeperRegistrationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	database.Insert in ;	database.Select sa; Update up;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopKeeperRegistrationController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		in = new Insert(); sa= new Select(); up = new Update();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("Text/HTML");
		PrintWriter pw = response.getWriter();boolean h = false;
		try {
			//System.out.println("in");
			int k=1;String showmsg=null;
			Map<Integer, String> inputvalues = new HashMap<Integer, String>();
			
			String edit="";
			if(request.getParameter("edit")!=null){
			edit=request.getParameter("edit");}
			if(edit.equals("editfeature")){
				k=1;
				inputvalues.put(k, request.getParameter("OwnerName"));k++;
				inputvalues.put(k, request.getParameter("NameOfShop"));k++;
				inputvalues.put(k, request.getParameter("email"));k++;
				inputvalues.put(k, request.getParameter("password"));k++;
				inputvalues.put(k, request.getParameter("ContactNumber1"));k++;
				inputvalues.put(k, request.getParameter("Category"));k++;
				String Shopid = request.getParameter("shopid");
				String sqlstring="ownername=?, nameofshop=?, shopemail=?, password=?, contact1=?, category=?";
				h=up.update("shopkeeperregistration",sqlstring ,inputvalues, "shopid", Shopid);
				showmsg="information has been submitted successfully";
				if(h){
					HttpSession session = request.getSession();
					session.setAttribute("shopid", Shopid);
					pw.println(showmsg+":::"+Shopid);
				}
				else{
					pw.println("Please try again there was an error in editing");
				}
			}else{
				inputvalues.put(k, null);k++;
				inputvalues.put(k, "");k++;
				inputvalues.put(k, request.getParameter("OwnerName"));k++;
				inputvalues.put(k, request.getParameter("NameOfShop"));k++;
				inputvalues.put(k, request.getParameter("email"));k++;
				inputvalues.put(k, request.getParameter("password"));k++;
				inputvalues.put(k, request.getParameter("ContactNumber1"));k++;
				inputvalues.put(k, request.getParameter("Category"));k++;
				inputvalues.put(k, "Yes");k++;

				for(int i=k;i<=17;i++){
					inputvalues.put(i, "");
				}
				String nextid=sa.getTableId("shopkeeperregistration", "SHOP");
			 h = in.insert("shopkeeperregistration", inputvalues);
			showmsg="information has been submitted successfully";
			if(h){
				HttpSession session = request.getSession();
				session.setAttribute("shopid", nextid);
				pw.println(showmsg+":::"+nextid);
			}
			else{
				pw.println("Please try again there was an error");
			}
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage().toString());
		}
	}

}
