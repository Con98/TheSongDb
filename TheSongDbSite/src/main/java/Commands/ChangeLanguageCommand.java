package Commands;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.Locale;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author tadas
 */
public class ChangeLanguageCommand implements Command{

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)
    {
        String forwardToJsp;
        
        // Update the language to the selected option
        String language = request.getParameter("language");
        // Assuming that the language parameter was supplied
        if(language != null){

            
            // Store the locale and the chosen language in the session
            HttpSession session = request.getSession();
            session.setAttribute("language", language);
        }
        
        // Deal with figuring out where to send the client back to
        // As we have the internationalisation language form stored in an include,
        // it could be from any page
        
        // This will happen even if there was no language parameter supplied
        // That is because we always want to send the user back where they came from
        // (or back to the home page)
        
        try
        {
            // Find the page path that sent us here
            String refererPage = new URI(request.getHeader("referer")).getPath();
            // Break the page path up into pieces based on /
            String[] pathPieces = refererPage.split("/");
            // Get the actual page name (this will always be the last part)
            forwardToJsp = "index.jsp";
        } catch (URISyntaxException ex)
        {
            //Display an error message to the log
            System.out.println("An error occured when trying to get the page that sent the client here: " + ex.getMessage());
            // If something goes wrong, default the user back to the home page
            forwardToJsp = "index.jsp";
        }
        
        return forwardToJsp;
    }

}
