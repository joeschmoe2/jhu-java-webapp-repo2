<%@ page import="beans.Registration" %>
<html>
<head>
    <title>Joe Offutt's Assignment 6</title>
    <style>
        table, th, td {
            border: 1px solid black;
        }
    </style>
</head>
<body style="margin-right:10%; margin-left:10%; background-color: navy">
    <div style="background-color:navajowhite">
        <img src="img/jhu_logo.png" title="JOHNS HOPKINS UNIVERSITY" />
        <div style="background-color: beige;box-shadow: navajowhite">
            <% Registration registration = (Registration) session.getAttribute("registration")
            ;
            if (registration == null)
            {
            registration = new Registration();
            }
            %>
            <div style=""><h2>Johns Hopkins Annual Software Development Seminar</h2></div>

            <form action="results.jsp" method="post">
                <div style="border: 1px solid burlywood; margin-left:5%;margin-right:5%">
                    <div style = "margin-left:7%; margin-right:7%; margin-bottom:3%">
                        <h3>Contact Information</h3>
                        <p>Name: <input type="text" name = "name" placeholder="Enter Name" value="<%=registration.getName()%>"/> </p>
                        <p>Email: <input type="text" name = "email" placeholder="Enter Email" value="<%=registration.getEmail()%>"/> </p>
                    </div>
                </div>
                <%
                    String allSelectedCourses="";
                    if(registration.getCourses() != null) {
                        for (int i = 0; i < registration.getCourses().length; i++) {
                            allSelectedCourses += registration.getCourses()[i] + ", ";
                        }
                    }
                %>
                <div style="border: 1px solid burlywood; margin-left:5%;margin-right:5%">
                    <div style = "margin-left:7%; margin-right:7%; margin-bottom:3%">
                        <h3>Select Your Courses</h3>
                        <select id="courseCheckBoxes" name="courses" multiple>
                            <option id="WebApps 101" value="WebApps 101"
                                    <%if(allSelectedCourses.contains("WebApps")){%>
                                    selected
                                    <%}%>
                            >Web Apps</option>
                            <option id="Programming 101" value="Programming 101"
                                <%if(allSelectedCourses.contains("Programming")){%>
                                selected
                                <%}%>
                                >Programming 101</option>
                            <option id="how to be 1337" value="how to be 1337"
                                    <%if(allSelectedCourses.contains("1337")){%>
                                    selected
                                    <%}%>>How to be 1337</option>
                            <option id="english 101" value="english 101"
                                    <%if(allSelectedCourses.contains("english")){%>
                                    selected
                                    <%}%>>English 101</option>
                        </select>
                    </div>
                </div>
                <script>
                    //multiple select values isn't working for some reason... spent like 3 hours but pretty sure there is a version change somewhere
                    //Went with a hackier approach above...
                    /*document.getElementById('courseCheckBoxes').options[0].selected;
                    document.getElementById('courseCheckBoxes').options[1].selected;*/
                </script>
                <div style="border: 1px solid burlywood; margin-left:5%;margin-right:5%">
                    <div style = "margin-left:7%; margin-right:7%; margin-bottom:3%">
                        <h3>Employment Status</h3>
                        <input id="student" type="radio" name="employment" value="student" /> jhu student
                        <input id="employee" type="radio" name="employment" value="employee" /> jhu employee
                        <input id="speaker" type="radio" name="employment" value="speaker" /> speaker
                        <input id="other" type="radio" name="employment" value="other" /> other
                    </div>
                <script>document.getElementById('<%=registration.getEmployment()%>').checked = true;</script>
                </div>
                <div style="border: 1px solid burlywood; margin-left:5%;margin-right:5%">
                    <div style = "margin-left:7%; margin-right:7%; margin-bottom:3%">
                        <h3>Additional Fees and Charges</h3>
                        <input id="parking" type="checkbox" name="fees" value="parking" /> Parking <br />
                        <input id="hotel" type="checkbox" name="fees" value="hotel" /> Hotel Accomodations <br />
                    </div>
                </div>
                <script>
                    <%if(registration.getFees() != null) {
                        for(int i=0;i<registration.getFees().length;i++){%>
                            document.getElementById('<%=registration.getFees()[i]%>').click();
                        <%}
                    }%>
                </script>
                <br />
                <div style="margin-left:7%"><input type="submit" value="Compute Seminar Costs" /></div>
                <br/>
            </form>
        </div>
    </div>
</body>
</html>
