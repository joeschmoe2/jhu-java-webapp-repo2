<html>
<head>
    <title>Error</title>
</head>
<body style="margin-right:10%; margin-left:10%; background-color: navy">
<div style="background-color:navajowhite">
    <img src="img/jhu_logo.png" title="JOHNS HOPKINS UNIVERSITY" />
    <div style="background-color: beige;box-shadow: navajowhite">
        <div style="margin-left:15px;"><h2>Johns Hopkins Annual Software Development Seminar</h2></div>
        <!-- TODO add line -->

        <%@ page isErrorPage="true" %>
        <h1>Java Error</h1>
        <p>Sorry, Java has thrown an exception.</p>
        <p>To continue, click the Back button.</p>
        <br>
        <h2>Details</h2>
        <p>
            Type: <%= exception.getClass() %><br>
            Message: <%= exception.getMessage() %><br>
        </p>
        <br/><br/>
    </div>
</div>
</body>
</html>
