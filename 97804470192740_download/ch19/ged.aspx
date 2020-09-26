<%@ Page Debug="true" Language="C#" %>
<%@ Import Namespace="System" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="Saxon.Api" %>

<script runat="server">

void Page_Load(Object sender, EventArgs e) {
    Uri sourceUri = new Uri(Server.MapPath(Request.QueryString["tree"] + ".xml"));
    Uri xsltUri = new Uri(Server.MapPath("ged-aspx.xsl"));
    Processor processor = new Processor(true);
    if (!processor.IsSchemaAware) {
        Response.Output.WriteLine("<p>Failed to load Saxon-SA (SAXON_HOME = " +
                        Environment.GetEnvironmentVariable("SAXON_HOME") + ")</p>");
    } 
    DocumentBuilder builder = processor.NewDocumentBuilder();
    builder.SchemaValidationMode = SchemaValidationMode.Strict;
    XdmNode input = builder.Build(sourceUri);
    XsltCompiler compiler = processor.NewXsltCompiler();
    compiler.ErrorList = new ArrayList();
    XsltExecutable executable;
    try {
        executable = compiler.Compile(xsltUri);
    } catch (Exception err) {
				Response.Output.WriteLine("<p>Failed to compile stylesheet</p>");
				foreach (StaticError error in compiler.ErrorList) {
            Response.Output.WriteLine("<p>At line " + error.LineNumber + ": " + error.Message + "</p>");
        } 
        return;   
    }        
        
    XsltTransformer transformer = executable.Load();
    transformer.InitialContextNode = input;
    transformer.SetParameter(new QName("", "id"), 
                             new XdmAtomicValue(Request.QueryString["id"]));
    transformer.SetParameter(new QName("", "tree"), 
                             new XdmAtomicValue(Request.QueryString["tree"]));
    Serializer serializer = new Serializer();
    serializer.SetOutputWriter(Response.Output);
    transformer.Run(serializer);      

}

</script>

