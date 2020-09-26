import javax.xml.transform.*;
import javax.xml.transform.stream.*;
import javax.xml.transform.dom.*;
import java.io.File;
import org.w3c.dom.Document;

public class Repeat {

    public static void main(String[] args) throws Exception {
		    StreamSource source = new StreamSource(new File(args[0]));
		    StreamSource style = new StreamSource(new File(args[1]));
		
		    TransformerFactory factory = TransformerFactory.newInstance();
		
		    // Build a DOM using an identity transform 
		    Transformer builder = factory.newTransformer();
		    DOMResult result = new DOMResult();
		    builder.transform(source, result);
		    Document doc = (Document)result.getNode();
		
		    // Compile the stylesheet
		    Templates templates = factory.newTemplates(style);
        
        // do one transformation for each parameter supplied
        for (int i=2; i<args.length; i++) {
            Transformer t = templates.newTransformer();
            System.out.println("\n======= TITLE = " + args[i] + "=======");
            t.setParameter("title", args[i]);
            t.transform(new DOMSource(doc), new StreamResult(System.out));
        }
    }
}