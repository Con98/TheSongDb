<%@page import="java.util.Locale"%>
<%@page import="org.apache.commons.i18n.bundles.TextBundle"%>

<!-- create a form to change the language based on changing the drop down selection -->
<form action="FrontController" method="post">
    <!-- When the value of the drop down changes, 
    submit the form and send the value to the controller -->
    <select name="language" onchange="this.form.submit()" class="form">
        <%            //Retrieve the resource bundle from the session

            TextBundle en = new TextBundle("option_en");
            TextBundle lt = new TextBundle("option_lt");
            if (language.equals("en")) {

        %>

        <option value="en" selected><%=en.getText(lang)%></option>
        <option value="lt"><%=lt.getText(lang)%></option>
        <%
        } else {
        %>
        <option value="lt" selected><%=lt.getText(lang)%></option>
        <option value="en"><%=en.getText(lang)%></option>
        <% }%>
    </select>
    <input type="hidden" name="action" value="changeLanguage"/>
</form>
