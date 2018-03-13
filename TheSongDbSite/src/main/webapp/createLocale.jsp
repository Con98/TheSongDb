<%@page import="java.util.Locale"%>
<%@page import="org.apache.commons.i18n.ResourceBundleMessageProvider"%>
<% ResourceBundleMessageProvider.install("TheSongDb");
    String language = (String) session.getAttribute("language");

// If there was no locale already set -- it's their first time here or their session timed out
    if (language == null) {
        // Get the locale for the client's browser (that is what's stored in the request)
        language = "en";
        // Save it as the currently selected locale
        session.setAttribute("language", language);
    }
    Locale lang = new Locale(language);
%>