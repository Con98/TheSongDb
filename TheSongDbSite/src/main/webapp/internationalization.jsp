<%@page import="java.util.Locale"%>
<%@page import="org.apache.commons.i18n.bundles.TextBundle"%>

<!-- create a form to change the language based on changing the drop down selection -->
<form action="FrontController" method="post">
    <!-- When the value of the drop down changes, 
    submit the form and send the value to the controller -->
    <select name="language" onchange="this.form.submit()" class="form-control">
        <%
            if (language.equals("en")) {

        %>

        <option value="en" selected><%=new TextBundle("option_en").getText(lang)%></option>
        <option value="lt"><%=new TextBundle("option_lt").getText(lang)%></option>
        <%
        } else {
        %>
        <option value="lt" selected><%=new TextBundle("option_lt").getText(lang)%></option>
        <option value="en"><%=new TextBundle("option_en").getText(lang)%></option>
        <% }%>
    </select>
    <input type="hidden" name="action" value="changeLanguage"/>
</form>
