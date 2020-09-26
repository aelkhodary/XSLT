import javax.xml.transform.*;
import javax.xml.transform.stream.*;
import java.io.File;

public class FileTransform {

    public static void main(String[] args) throws Exception {
        StreamSource source = new StreamSource(new File(args[0]));
        StreamSource style = new StreamSource(new File(args[1]));
        StreamResult out = new StreamResult(new File(args[2]));

        TransformerFactory factory = TransformerFactory.newInstance();
        Transformer t = factory.newTransformer(style);
        t.transform(source, out);
    }
}