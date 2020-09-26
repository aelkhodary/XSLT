import javax.xml.transform.*;
import javax.xml.transform.stream.*;
import java.io.File;

public class Parameters {

    public static void main(String[] args) throws Exception {
    StreamSource source = new StreamSource(new File(args[0]));
    StreamSource style = new StreamSource(new File(args[1]));
    String title = args[2];

    TransformerFactory factory = TransformerFactory.newInstance();
    Transformer t = factory.newTransformer(style);
    t.setParameter("title", title);
    t.setOutputProperty(OutputKeys.INDENT, "no");
    t.transform(source, new StreamResult(System.out));

    }
}