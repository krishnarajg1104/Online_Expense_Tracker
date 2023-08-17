package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.db.HibernateUtil;
import com.entity.User;

@WebServlet("/userRegister")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String fullname = req.getParameter("fullname");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		User user = new User(fullname, email, password);
		
//		System.out.println(user);
		
		UserDao dao = new UserDao(HibernateUtil.getSessionFactory());
		boolean f = dao.saveuser(user);
		
		HttpSession session = req.getSession();
		
		if(f) {
			session.setAttribute("msg", "Registered Successfully");
			//System.out.println("Registered Successfully");
			resp.sendRedirect("register.jsp");
		}else {
			session.setAttribute("msg", "Registered Unsuccessfully");
			//System.out.println("Registered Unsuccessfully");
			resp.sendRedirect("register.jsp");
		}
	}
	
	

}
