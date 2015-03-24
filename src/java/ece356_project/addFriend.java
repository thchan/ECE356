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
import javax.servlet.http.HttpSession;

/**
 *
 * @author Thomas
 */
@WebServlet(name = "addFriend", urlPatterns = {"/addFriend"})
public class addFriend extends HttpServlet {

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

            Login user;
            HttpSession session = request.getSession();
            user = (Login)session.getAttribute("user");
            String p_alias = request.getParameter("alias");
            
            //Check if already a friends
            boolean areFriends = ProjectDBAO.areFriends(user.user_alias, p_alias);
            
            if (areFriends)
            {
                url = ("/alreadyFriends.jsp");
            }
            else
            {
                //if they sent a request, confirm it
                //if you sent the request, say you already sent it
                
                boolean theirRequestExists = ProjectDBAO.theirRequestExists(user.user_alias, p_alias);
                boolean yourRequestExists = ProjectDBAO.yourRequestExists(user.user_alias, p_alias);
                if (user.user_alias == p_alias)
                {
                    url = ("/cannotBeFriendsWithSelf.jsp");
                }
                else if (theirRequestExists)
                {
                    ProjectDBAO.confirmFriend(user.user_alias, p_alias);
                    url = ("/confirmFriendSuccess.jsp");
                }
                else if (yourRequestExists)
                {
                    url = ("/requestAlreadySent.jsp");
                }
                else
                {
                    ProjectDBAO.sendFriendRequest(user.user_alias, p_alias);
                    url = ("/addFriendSuccess.jsp");
                }
            }

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
