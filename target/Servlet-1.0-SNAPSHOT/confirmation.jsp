<!doctype html public "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Joe Offutt Assignment 6</title>
</head>
<body style="margin-right:10%; margin-left:10%; background-color: navy">
    <div style="background-color:navajowhite">
        <a href="/index.jsp"><img src="img/jhu_logo.png" title="JOHNS HOPKINS UNIVERSITY" /></a>
        <div style="background-color: beige;box-shadow: navajowhite">
            <div style="margin-left:30px;padding-top:15px;padding-left:15px;">
                <%@ page import="beans.Email" %>
                <%
                Email email = (Email) session.getAttribute("email");

                if (email == null)
                {
                    email = new Email();
                }

                email.sendMail(request.getParameter("toEmail"),request.getParameter("fromEmail"),
                        request.getParameter("subject"),request.getParameter("body"),false);

                %>
                <p>A confirmation email has been sent. Thanks for spending your hard earned monies.</p>
                <br />
            </div>
        </div>
    </div>
</body>
</html>