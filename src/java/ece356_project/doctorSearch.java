/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ece356_project;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author Thomas
 */
@WebServlet(name = "doctorSearch", urlPatterns = {"/doctorSearch"})
public class doctorSearch extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String url;
        try {
			// TODO Add user sign in here
            String first_name = request.getParameter("first_name");
            String last_name = request.getParameter("last_name");
            String address = request.getParameter("address");
            String gender = request.getParameter("gender");
            int license_year = -1;
            try{
                   license_year = Integer.parseInt(request.getParameter("licensed"));
            }catch(Exception e){}
            String comments = request.getParameter("keyword");
            int rating = -1;
            try{
                   license_year = Integer.parseInt(request.getParameter("rating"));
            }catch(Exception e){}
            String specialization = request.getParameter("spec");
            if (request.getParameter("reviewed") == null)
            {
                request.setAttribute("friend_reviewed", true);
            }else{
                request.setAttribute("friend_reviewed", false);
            }
            ArrayList ret = ProjectDBAO.searchDoctors(first_name, last_name, address, gender, license_year, comments, rating, specialization,"pat_bob");
            request.setAttribute("doctorList", ret);
            url="/doctorSearchSuccess.jsp";
        }catch(Exception e){
            request.setAttribute("errmsg", e);
            url = "/error.jsp";
        }
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
