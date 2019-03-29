package kr.spring.location.controller;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.Charset;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.cxf.helpers.IOUtils;
import org.apache.cxf.io.CachedOutputStream;
import org.apache.cxf.io.CachedOutputStreamCallback;
import org.apache.cxf.message.Message;
import org.json.simple.JSONObject;

/**
 * Servlet implementation class test
 */
@WebServlet("/PublicData.do")
public class PublicData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PublicData() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/locationBasedList?ServiceKey=";
		String serviceKey = "429e9l%2BRPBvvMYSqI0TIu0JgvFl1vio2dcUfXj7d66%2F%2B2glco1EDs1HDHJBssw9U7HAt1A11Cy6N0Hbk2INDfQ%3D%3D";
		String parameter = "";
//		serviceKey = URLEncoder.encode(serviceKey,"utf-8");
		PrintWriter out = response.getWriter();
		parameter = parameter + "&" + "mapX=126.9829448";
		parameter = parameter + "&" + "mapY=37.5679134";
		parameter = parameter + "&" + "radius=1000";
		parameter = parameter + "&" + "pageNo=1&numOfRows=10";
		parameter = parameter + "&" + "listYN=Y";
		parameter = parameter + "&" + "arrange=A";
		parameter = parameter + "&" + "MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=AppTest";
		parameter = parameter + "&" + "_type=json";
		
		
		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);

		System.out.println(addr);
		
//		BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));

		InputStream in = url.openStream(); 
//		CachedOutputStream bos = new CachedOutputStream();
		ByteArrayOutputStream  bos1 = new ByteArrayOutputStream();
		IOUtils.copy(in, bos1);
		in.close();
		bos1.close();
	    
		String mbos = bos1.toString("UTF-8");
		System.out.println("mbos: "+mbos);
	    
		byte[] b = mbos.getBytes("UTF-8");
		String s = new String(b, "UTF-8");
		out.println(s);
		
		JSONObject json = new JSONObject();
		json.put("data", s);
//		json.put("data", data);
		System.out.println("json: "+json);
		
	}
}
