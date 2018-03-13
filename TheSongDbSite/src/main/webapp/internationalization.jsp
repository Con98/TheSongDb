<%@page import="java.util.Locale"%>
<%@page import="org.apache.commons.i18n.ResourceBundleMessageProvider"%>
<%@page import="org.apache.commons.i18n.bundles.TextBundle"%>

<% ResourceBundleMessageProvider.install("TheSongDb");
    String language = (String) session.getAttribute("language");

// If there was no locale already set -- it's their first time here or their session timed out
    if (language.equalsIgnoreCase("")) {
        // Get the locale for the client's browser (that is what's stored in the request)
        language = "en";
        // Save it as the currently selected locale
        session.setAttribute("language", language);
    }
%>

<!-- create a form to change the language based on changing the drop down selection -->
<form action="FrontController" method="post">
    <!-- When the value of the drop down changes, 
    submit the form and send the value to the controller -->
    <select name="language" onchange="this.form.submit()">
        <%            //Retrieve the resource bundle from the session

            language = (String) session.getAttribute("language");
            TextBundle en = new TextBundle("option_en");
            TextBundle lt = new TextBundle("option_lt");
            if (language.equals("en")) {

        %>

        <option value="en" selected><%=en.getText(new Locale(language))%></option>
        <option value="lt"><%=lt.getText(new Locale(language))%></option>
        <%
        } else {
        %>
        <option value="en"><%=en.getText(new Locale(language))%></option>
        <option value="lt" selected><%=lt.getText(new Locale(language))%></option>
    </select>
    <input type="hidden" name="action" value="changeLanguage"/>
</form>
