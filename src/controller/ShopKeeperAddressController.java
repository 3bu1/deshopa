package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.Insert;
import database.Select;
import database.Update;

/**
 * Servlet implementation class ShopKeeperAddressController
 */
@WebServlet("/ShopKeeperAddressController")
public class ShopKeeperAddressController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	database.Insert in ;	database.Select sa; Update up;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopKeeperAddressController() {
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
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("Text/HTML");
		PrintWriter pw = response.getWriter();boolean h = false;
		HttpSession session = request.getSession();
		try {
			//System.out.println("in");
			
			String showmsg=null;String SHOPID ="";
			if(session.getAttribute("shopid")!=null){SHOPID= session.getAttribute("shopid").toString();}
			
			Map<Integer, String> inputvalues = new HashMap<Integer, String>();
			String edit="";
			if(request.getParameter("edit")!=null){
				edit=request.getParameter("edit");}
			if(edit.equals("editfeature")){
				int j=1;
				inputvalues.put(j, request.getParameter("street_number"));j++;
				inputvalues.put(j, request.getParameter("route"));j++;
				inputvalues.put(j, request.getParameter("locality"));j++;
				inputvalues.put(j, request.getParameter("administrative_area_level_1"));j++;
				inputvalues.put(j, request.getParameter("country"));j++;
				inputvalues.put(j, request.getParameter("postal_code"));j++;
				inputvalues.put(j, request.getParameter("landmark"));j++;
				//System.out.println("servlet"+inputvalues.size());
				String Shopid = request.getParameter("shopid");
				String sqlstring="streetaddress=?, roadno=?, city=?, state=?, country=?, pincode=?, landmark=?";
				h=up.update("shopaddress",sqlstring ,inputvalues, "shopid", Shopid);
				showmsg="information has been submitted successfully";
				if(h){
					System.out.println("2"+Shopid);
					pw.println(showmsg+":::"+Shopid);
				}
				else{
					pw.println("Please try again there was an error in editing");
				}
			}else{
				int k=1;
				inputvalues.put(k, null);k++;
				inputvalues.put(k, "");k++;
				inputvalues.put(k, request.getParameter("street_number"));k++;
				inputvalues.put(k, request.getParameter("route"));k++;
				inputvalues.put(k, request.getParameter("locality"));k++;
				inputvalues.put(k, request.getParameter("administrative_area_level_1"));k++;
				inputvalues.put(k, request.getParameter("country"));k++;
				inputvalues.put(k, request.getParameter("postal_code"));k++;
				inputvalues.put(k, request.getParameter("landmark"));k++;
				inputvalues.put(k, SHOPID);k++;
				for(int i=11;i<=13;i++){
					inputvalues.put(i, "");
				}
				
				String nextid=sa.getTableId("shopaddress", "add");
			 h = in.insert("shopaddress", inputvalues);
			
			showmsg="information has been submitted successfully";
			if(h){
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
