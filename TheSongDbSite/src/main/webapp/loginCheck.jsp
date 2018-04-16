<%-- 
    Document   : loginCheck
    Created on : Apr 11, 2018, 9:39:38 AM
    Author     : Thomas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LoginCheck</title>
    </head>
    <body>
        <%
            if(session.getAttribute("login") == null){
                
            
            %>
            <script>window.location="index.jsp"</script>
            <%
                }
                %>
    </body>
    
    
</html>
