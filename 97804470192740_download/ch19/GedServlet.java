import net.sf.saxon.FeatureKeys;
import net.sf.saxon.om.Validation;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.transform.*;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import java.io.File;
import java.io.IOException;
import java.io.PrintStream;
 
public class GedServlet extends HttpServlet {

    public void init(javax.servlet.ServletConfig conf)
            throws javax.servlet.ServletException {
        super.init (conf);
        System.setProperty("javax.xml.transform.TransformerFactory",
                          "com.saxonica.SchemaAwareTransformerFactory");
    }


   /**
    * Respond to an HTTP request
    */
   
    public void service(HttpServletRequest req, HttpServletResponse res)
	      throws ServletException, IOException {
        res.setContentType("text/html");

        try {
            String clear = req.getParameter("clear");
            if (clear!=null && clear.equals("yes")) {
                resetData();
            }
            String family = req.getParameter("tree");
            Source source = new StreamSource(
                new File(getServletContext().getRealPath("/" + family + ".xml")));

            Result result = new StreamResult(res.getOutputStream());   
         
            Templates style = getStyleSheet(); 
            Transformer transformer = style.newTransformer();
            transformer.setParameter("id", req.getParameter("id"));
            transformer.setParameter("tree", family);
            transformer.transform(source, result);
           
        } catch (Exception err) {
            PrintStream ps = new PrintStream(res.getOutputStream());
            ps.println("Error applying stylesheet: " + err.getMessage());
            err.printStackTrace(ps);
        } 
    }

    /**
    * Get the prepared stylesheet from memory; prepare it if necessary
    */

    private synchronized Templates getStyleSheet() 
    throws TransformerConfigurationException, java.io.IOException {
        if (stylesheet == null) {
            File sheet = new File(getServletContext().getRealPath("/ged-servlet.xsl"));
            TransformerFactory factory = TransformerFactory.newInstance();
            factory.setAttribute(
                "http://saxon.sf.net/feature/schema-validation", 
                new Integer(1));
            stylesheet = factory.newTemplates(new StreamSource(sheet));

        }
        return stylesheet;
    }

    /**
    * Reset data held in memory
    */

    private synchronized void resetData() {
        stylesheet = null;
    }

    private Templates stylesheet = null;
}
