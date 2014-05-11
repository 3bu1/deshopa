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
 * Servlet implementation class ProductController
 */
@WebServlet("/ProductController")
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	database.Insert in ;	database.Select sa; Update up;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductController() {
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
			//	System.out.println("1");
				int k=1;
				inputvalues.put(k, request.getParameter("title"));k++;
				inputvalues.put(k, request.getParameter("description"));k++;
				inputvalues.put(k, request.getParameter("category"));k++;
				inputvalues.put(k, request.getParameter("subcat"));k++;
				inputvalues.put(k, request.getParameter("supersubcategory"));k++;
				inputvalues.put(k, request.getParameter("price"));k++;
				inputvalues.put(k, request.getParameter("discounts"));k++;
				inputvalues.put(k, request.getParameter("sizes"));k++;
				inputvalues.put(k, request.getParameter("material"));k++;
				inputvalues.put(k, request.getParameter("Sleeves"));k++;
				inputvalues.put(k, request.getParameter("fit"));k++;
				inputvalues.put(k, request.getParameter("colours"));k++;
				inputvalues.put(k, request.getParameter("neck"));k++;
				inputvalues.put(k, request.getParameter("washcare"));k++;
				inputvalues.put(k, request.getParameter("quantity"));k++;
				String productid=request.getParameter("productid");
				String sqlstring="title=?, description=?, category=?, subcategory=?, supersubcat=?, price=?, discounts=?, size=?, material=?, sleeves=?, fit=?, color=?, neck=?, washcare=?, quantity=?";
				h=up.update("product",sqlstring ,inputvalues, "productid", productid);
				showmsg="information has been submitted successfully";
				if(h){
					//System.out.println("2"+SHOPID);
					pw.println(showmsg+":::"+SHOPID);
				}
				else{
					pw.println("Please try again there was an error in editing");
				}
			}else{
				int k=1;
				inputvalues.put(k, null);k++;
				inputvalues.put(k, "");k++;
				inputvalues.put(k, request.getParameter("title"));k++;
				inputvalues.put(k, request.getParameter("description"));k++;
				inputvalues.put(k, request.getParameter("category"));k++;
				inputvalues.put(k, request.getParameter("subcat"));k++;
				inputvalues.put(k, request.getParameter("supersubcategory"));k++;
				inputvalues.put(k, request.getParameter("price"));k++;
				inputvalues.put(k, request.getParameter("discounts"));k++;
				inputvalues.put(k, request.getParameter("sizes"));k++;
				inputvalues.put(k, request.getParameter("material"));k++;
				inputvalues.put(k, request.getParameter("Sleeves"));k++;
				inputvalues.put(k, request.getParameter("fit"));k++;
				inputvalues.put(k, request.getParameter("colours"));k++;
				inputvalues.put(k, request.getParameter("neck"));k++;
				inputvalues.put(k, request.getParameter("washcare"));k++;
				inputvalues.put(k, "");k++;
				inputvalues.put(k, "");k++;
				inputvalues.put(k, request.getParameter("quantity"));k++;
				
				inputvalues.put(k, SHOPID);k++;
				for(int i=k;i<=new Select().getTableColumnCount("product");i++){
					inputvalues.put(i, "");
				}
				
				String nextid=sa.getTableId("product", "pro");
			 h = in.insert("product", inputvalues);
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
