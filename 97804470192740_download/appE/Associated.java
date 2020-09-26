import javax.xml.transform.*;
import javax.xml.transform.stream.*;
import java.io.File;

public class Associated {

    public static void main(String[] args) throws Exception {
        StreamSource source = new StreamSource(new File(args[0]));
        
        TransformerFactory factory = TransformerFactory.newInstance();
        
        // Get the associated stylesheet for the source document     
        
        Source style = factory.getAssociatedStylesheet(source, null, null, null);
        
        // Use this to do the transformation
        
        Transformer t = factory.newTransformer(style);
        t.transform(source, new StreamResult(System.out));
    }
}