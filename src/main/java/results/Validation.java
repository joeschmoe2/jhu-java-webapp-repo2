package results;

import java.io.IOException;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class Validation extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // get parameters from the formString name = request.getParameter("name");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String[] courses = request.getParameterValues("courses");
        String employment = request.getParameter("employment");
        String[] fees = request.getParameterValues("fees");
        String errors = "";

        int total=0;
        int cost=0;
        int additionalFees=0;

        if(employment!=null) {
            if (employment.equals("student"))
                cost = 1000;
            else if (employment.equals("employee"))
                cost = 850;
            else if (employment.equals("speaker"))
                cost = 0;
            else if (employment.equals("other"))
                cost = 1350;
        }
        else{
            throw new ServletException("Missing Employment Type");
        }

        if(courses==null){
            throw new ServletException("You must select a course");
        }

        total = cost * courses.length;

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        out.println("<!doctype html public '-//W3C//DTD HTML 4.0 Transitional//EN'>\n" +
        "<html>\n" +
            "<head>\n" +
                "<title>Joe Offutt Assignment 3</title>\n" +
            "</head>\n" +
            "<body style='margin-right:10%; margin-left:10%; background-color: navy'> \n" +
                "<div style='background-color:navajowhite'>\n" +
                "<a href='/index.html'><img src='img/jhu_logo.png' title='JOHNS HOPKINS UNIVERSITY' /></a>\n" +
                "<div style='background-color: beige;box-shadow: navajowhite'>\n" +
                "<div style='margin-left:30px;padding-top:15px;padding-left:15px;'>\n");

                out.println("<p>Hi <b>" + name + "</b></p>\n" +
                    "<p>Your email address is : <b>" + email + "</b></p>\n" +
                    "<p>Your employment is listed as : <b>" + employment + "</b></p>\n"+
                    "<p>You are registered for the following courses:</p>");

                for(int i=0;i<courses.length;i++){
                    out.println("<li style='margin-left:25px'>" + courses[i] + " : $" + cost + "</li>");
                }

                if(fees!=null){
                    out.println("<p>The additional fees you have selected are:</p>");
                    for(int i = 0;i<fees.length;i++){
                        if(fees[i].equals("hotel")){
                            additionalFees=185;
                            total+=additionalFees;
                        }
                        else if(fees[i].equals("parking")){
                            additionalFees=10;
                            total+=additionalFees;
                        }
                        out.println("<li style='margin-left:25px'>" + fees[i] + " : $" + additionalFees+ "</li>");
                    }
                }
                else {
                    out.println("<p>No Additional Fees");
                }

                out.println("<p>Your total is: <b>" + total + "</b></p><br/><br/>");

        out.println("</div>");
        out.println("</div>");
        out.println("</body>");
        out.println("</html>");

        out.close();
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        doPost(request, response);
    }
}
