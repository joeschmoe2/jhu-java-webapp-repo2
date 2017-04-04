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

                <%@ page import="beans.Registration" %>
                <%
                    Registration registration = (Registration) session.getAttribute("registration");

                    if (registration == null)
                    {
                        registration = new Registration();
                    }

                    /*String name = request.getParameter("name");
                    String email = request.getParameter("email");
                    String[] courses = request.getParameterValues("courses");
                    String employment = request.getParameter("employment");
                    String[] fees = request.getParameterValues("fees");*/

                    /*if(!registration.getName().equals("") || request.getParameter("removeCourse") == null)
                        registration.setName(request.getParameter("name"));
                    if(!registration.getEmail().equals("") || request.getParameter("removeCourse") == null)
                        registration.setEmail(request.getParameter("email"));
                    if(registration.getCourses() == null || request.getParameter("removeCourse") == null)
                        registration.setCourses(request.getParameterValues("courses"));
                    if(!registration.getEmployment().equals("") || request.getParameter("removeCourse") == null)
                        registration.setEmployment(request.getParameter("employment"));
                    if(registration.getFees() == null || request.getParameter("removeCourse") == null)
                        registration.setFees(request.getParameterValues("fees"));*/
                    if(request.getParameter("removeCourse") == null) {
                        registration.setName(request.getParameter("name"));
                        registration.setEmail(request.getParameter("email"));
                        registration.setCourses(request.getParameterValues("courses"));
                        registration.setEmployment(request.getParameter("employment"));
                        registration.setFees(request.getParameterValues("fees"));
                    }

                    if(request.getParameter("removeCourse") != null) {
                        registration.removeCourse(request.getParameter("removeCourse"));
                    }

                    String name = registration.getName();
                    String email = registration.getEmail();
                    String[] courses = registration.getCourses();
                    String employment = registration.getEmployment();
                    String[] fees = registration.getFees();

                    String errors = "";

                    int total=0;
                    int cost=0;
                    int additionalFees=0;

                    if(employment != null) {
                        if (employment.equals("student"))
                            cost = 1000;
                        else if (employment.equals("employee"))
                            cost = 850;
                        else if (employment.equals("speaker"))
                            cost = 0;
                        else if (employment.equals("other"))
                            cost = 1350;
                    }
                %>
                <p>Hi <b><%=name%></b></p>
                <p>Your email address is : <b><%=email%></b></p>
                <%if(employment !=null){%>
                <p>Your employment is listed as : <b><%=employment%></b></p>

                <hr>

                <%} else {
                    errors="Need to select employment type";
                    %>
                    <p>error</p>
                <%}%>

                <% if(courses!=null) {
                    total = cost * courses.length;
                %>
                    <p>You are registered for the following courses:</p>
                    <% for(int i=0;i<courses.length;i++){%>
                        <li style="margin-left:25px"><%=courses[i]%> : $<%=cost%>
                            <input type="button" value="Remove" onClick="location.href='results.jsp?removeCourse=<%=i%>'" />
                        </li>
                <%}} else {
                    errors="Need to choose courses";%>
                    <h1>ERROR - Did not select any courses</h1>
                <%}%>

                <% if(fees!=null) {%>
                    <p>The additional fees you have selected are:</p>
                    <% for(int i=0;i<fees.length;i++){
                        if(fees[i].equals("hotel")){
                            additionalFees=185;
                            total+=additionalFees;
                        }
                        else if(fees[i].equals("parking")){
                            additionalFees=10;
                            total+=additionalFees;
                        }
                    %>
                        <li style="margin-left:25px"><%=fees[i]%> : $<%=additionalFees%></li>
                <%}} else {%>
                    <p>No additional Fees:</p>
                <%}%>


                <% if(errors == ""){%>
                    <p>Your total is: <b>$<%=total%></b></p><br/>
                    <p>
                        <input type="button" value="Edit Information" onClick="location.href='index.jsp'" />
                        <input type="button" value="Add More Courses" onClick="location.href='index.jsp'" />
                    </p>
                    <form action="confirmation.jsp" method="post">
                        <input type="hidden" name = "toEmail" value="<%=registration.getEmail()%>"/>
                        <input type="hidden" name = "fromEmail" value="joffEmailServer@gmail.com"/>
                        <%
                            String subject="Class registration for " + registration.getName();
                            String body="Greetings " + registration.getName() +",\n" +
                                    "\nYou have signed up for the following courses :\n";
                                    for(int i=0;i<courses.length;i++){
                                        body+="\t-" + courses[i] + ": $" + cost+"\n";
                                    }
                                    body+="\nAdditional expenses include: ";
                            if(fees.length>1)
                                body+="hotel ($185.00) and parking ($10.00) \n";
                            else if(fees[0].equals("hotel"))
                                body+="hotel ($185.00)\n";
                            else if(fees[0].equals("parking"))
                                body+="parking ($10.00)\n";

                            body+="\n\n Your total comes to: $" + total;
                            body+="\n Thanks for signing up, \n Joff";
                        %>
                        <input type="hidden" name = "subject" value="<%=subject%>"/>
                        <input type="hidden" name = "body" value="<%=body%>"/>
                        <input type="submit" value="Confirm" />
                    </form>
                    <br/>

                    <h1 style="text-align:center">Thanks for spending your hard earned monies</h1><br/>
                <%} else {%>
                    <script>alert("<%=errors%>");</script>
                    <p>Errors in app</p>
                <%}
                    session.setAttribute("registration", registration);
                %>
                <br />
            </div>
        </div>
    </div>
</body>
</html>