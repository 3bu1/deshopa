package controller;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.HashMap;
import java.util.List;import java.util.Iterator;import java.util.Map;
import java.io.File;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.*;

import database.Insert;
import database.Select;
import database.Update;
/**
 * Servlet implementation class ShopCoverImageController
 */
@WebServlet("/ShopCoverImageController")
public class ShopCoverImageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final HashMap Integer = null;
	database.Insert in ;	database.Select sa; database.Update up;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopCoverImageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		in = new Insert(); sa= new Select();up = new Update();
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
	@SuppressWarnings("null")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Shopid="";String img="";
		boolean isMultipart =ServletFileUpload.isMultipartContent(request);
		if (!isMultipart) {
		System.out.println("File Not Uploaded");
		} else {
		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		List items = null;
		try {
		items = upload.parseRequest(request);
		} catch (FileUploadException e) {
		e.printStackTrace();
		}
		Iterator itr = items.iterator();

		while (itr.hasNext()) {
			
			FileItem item = (FileItem) itr.next();
			
			if (item.isFormField()){
				 String name = item.getFieldName();
				 String fieldvalue = item.getString();
				if(name.equals("shopid")){
			  		try {
			  			Shopid=fieldvalue;
			  			//System.out.println(Shopid);
			      		} catch (Exception e) {
							e.printStackTrace();
						}
			  	} 
			} else {
				try {
					String name = item.getFieldName();
					String itemName = item.getName();
					if(!itemName.equals("")){
						
						if(name.equals("coverimage")){
								int IndexOf = itemName.indexOf("."); 
								String domainName = itemName.substring(IndexOf);
								itemName = itemName.substring(0, IndexOf);
								String finalimage="";
								finalimage = Shopid+domainName;
								if(!finalimage.equals("") && !domainName.equals("")){
								File savedFile = new File("C:/tribhuvan/work/workspace/deshopa/WebContent/"+"COVERPAGEPHOTO\\"+finalimage);
								item.write(savedFile);
								}
								try {
									img=finalimage;
									Map<Integer, String> inputvalues = new HashMap<Integer, String>();
									inputvalues.put(1, img);
									String sqlstring="coverpageimage=?";
									boolean xyz=false;
								xyz=up.update("shopkeeperregistration",sqlstring ,inputvalues, "shopid", Shopid);
								if(xyz){
									response.sendRedirect("shopAddressForm.jsp");
								}
							
								} catch (Exception e) {
								System.out.println(e.getMessage());
								} 
								
						}}}catch (Exception e) {
							System.out.println(e.getMessage());
						}

			}
		}
		
		}
		
	}

}
