import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import javax.xml.transform.*;
import javax.xml.transform.sax.SAXResult;
import javax.xml.transform.stream.StreamSource;
import org.apache.fop.apps.FOPException;
import org.apache.fop.apps.FOUserAgent;
import org.apache.fop.apps.Fop;
import org.apache.fop.apps.FopFactory;
import org.apache.fop.apps.MimeConstants;

public class XmlToPdf {
    public static void main(String[] args) {
        XmlToPdf fOPPdfDemo = new XmlToPdf();
        try {
            fOPPdfDemo.convertToPDF();
        } catch (FOPException | IOException | TransformerException e) {
            e.printStackTrace();
        }
    }

    /**
     * Method that will convert the given XML to PDF
     * @throws IOException
     * @throws FOPException
     * @throws TransformerException
     */
    public void convertToPDF()  throws IOException, FOPException, TransformerException {
        // the XSL FO file
        File xsltFile = new File("./src/main/resources/monastery.xsl");
        // the XML file which provides the input
        StreamSource xmlSource = new StreamSource(new File("./src/main/resources/monastery.xml"));
        // create an instance of fop factory
        FopFactory fopFactory = FopFactory.newInstance(new File(".").toURI());
        // a user agent is needed for transformation
        FOUserAgent foUserAgent = fopFactory.newFOUserAgent();
        // Setup output
        OutputStream out;
        out = Files.newOutputStream(Paths.get("./src/main/resources/monastery.pdf"));

        try {
            // Construct fop with desired output format
            Fop fop = fopFactory.newFop(MimeConstants.MIME_PDF, foUserAgent, out);

            // Setup XSLT
            TransformerFactory factory = TransformerFactory.newInstance();
            Transformer transformer = factory.newTransformer(new StreamSource(xsltFile));

            // Resulting SAX events (the generated FO) must be piped through to FOP
            Result res = new SAXResult(fop.getDefaultHandler());

            // Start XSLT transformation and FOP processing
            // That's where the XML is first transformed to XSL-FO and then
            // PDF is created
            transformer.transform(xmlSource, res);
        } finally {
            out.close();
        }
    }
}
