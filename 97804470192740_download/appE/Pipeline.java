import javax.xml.parsers.*;
import javax.xml.transform.*;
import javax.xml.transform.stream.*;
import javax.xml.transform.sax.*;
import java.io.File;
import java.util.Stack;
import org.xml.sax.*;
import org.xml.sax.helpers.XMLFilterImpl;
import org.xml.sax.helpers.AttributesImpl;

public class Pipeline {

    public static void main(String[] args) throws Exception {
        new Pipeline().run(args[0]);
    }
    
    public void run(String input) throws Exception {
        StreamSource source = new StreamSource(new File(input));
        File style = new File("filter.xsl");
        
        TransformerFactory factory = TransformerFactory.newInstance();
        if (!factory.getFeature(SAXTransformerFactory.FEATURE_XMLFILTER)) {
            System.err.println("SAX Filters are not supported by this processor");
        } else {
        
            SAXParserFactory parserFactory = SAXParserFactory.newInstance();
            parserFactory.setNamespaceAware(true);
            XMLReader parser = parserFactory.newSAXParser().getXMLReader();
        
            SAXTransformerFactory saxFactory = (SAXTransformerFactory)factory;

            XMLFilter pre = new PreFilter();
            pre.setParent(parser);
            
            XMLFilter filter = saxFactory.newXMLFilter(new StreamSource(style));
            filter.setParent(pre);
            
            XMLFilter post = new PostFilter();
            post.setParent(filter);
            
            TransformerHandler serializer = saxFactory.newTransformerHandler();
            serializer.setResult(new StreamResult(System.out));
            Transformer trans = serializer.getTransformer();
            trans.setOutputProperty(OutputKeys.METHOD, "xml");
            trans.setOutputProperty(OutputKeys.INDENT, "yes");
            
            post.setContentHandler(serializer);
            post.parse(source.getSystemId());
        }                       
    }
    
    private class PreFilter extends XMLFilterImpl {
        
        public void startElement (String uri, String localName, String qName,
			      Attributes atts)
	    throws SAXException {
	        String newLocalName = localName.toLowerCase();
	        String newQName = qName.toUpperCase();
	        AttributesImpl newAtts =
	            (atts.getLength()>0 ?
	                new AttributesImpl(atts) :
	                new AttributesImpl());
	        newAtts.addAttribute("", "old-local-name", "old-local-name", "CDATA", localName);
	        newAtts.addAttribute("", "old-qname", "old-qname", "CDATA", qName);
	        super.startElement(uri, newLocalName, newQName, newAtts);
	    }
	    
	    public void endElement (String uri, String localName, String qName)
	    throws SAXException {
	        String newLocalName = localName.toLowerCase();
	        String newQName = qName.toUpperCase();
	        super.endElement(uri, newLocalName, newQName);
	    }
	}

    private class PostFilter extends XMLFilterImpl {
        
        public Stack stack;
        
        public void startDocument() throws SAXException {
            stack = new Stack();
            super.startDocument();
        }
        
        public void startElement (String uri, String localName, String qName,
			      Attributes atts)
	      throws SAXException {
            
	        String originalLocalName = localName;
	        String originalQName = qName;
	        AttributesImpl newAtts = new AttributesImpl();
	        for (int i=0; i<atts.getLength(); i++) {
	            String name = atts.getQName(i);
	            String val = atts.getValue(i);
	            if (name.equals("old-local-name")) {
	                originalLocalName = val;
	            } else if (name.equals("old-qname")) {
	                originalQName = val;
	            } else {
	                newAtts.addAttribute(
	                             atts.getURI(i),
	                             atts.getLocalName(i),
	                             name,
	                             atts.getType(i),
	                             val);
	            }
            }
	        super.startElement(uri, originalLocalName, originalQName, newAtts);
	        stack.push(originalLocalName);
	        stack.push(originalQName);
	    }
	    
	    public void endElement (String uri, String localName, String qName)
	    throws SAXException {
	        String originalQName = (String)stack.pop();
	        String originalLocalName = (String)stack.pop();
	        super.endElement(uri, originalLocalName, originalQName);
	    }
	}

	        
}