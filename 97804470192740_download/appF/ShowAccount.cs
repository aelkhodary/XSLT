using System;
using System.IO;
using System.Collections.Generic;
using System.Text;
using Saxon.Api;
using System.Xml;
using test;

namespace Examples {
    class ShowAccount {
    
        // Designed to be called with arguments: calls.xml greet.xsl

        static void Main(string[] args) {
            String sourceFile;
            if (Path.IsPathRooted(args[0])) {
                sourceFile = args[0];
            } else {
                sourceFile = Environment.CurrentDirectory + "/" + args[0];
            }
            String styleFile;
            if (Path.IsPathRooted(args[1])) {
                styleFile = args[1];
            } else {
                styleFile = Environment.CurrentDirectory + "/" + args[1];
            }
            
            SimpleTransformation("file:/" + sourceFile, "file:/" + styleFile);
        }

        public static void SimpleTransformation(String sourceUri, String xsltUri) {

            // Create a Processor instance.
            Processor processor = new Processor();

            // Load the source document
            XdmNode input = processor.NewDocumentBuilder().Build(new Uri(sourceUri));

            // Create a transformer for the stylesheet.
            XsltTransformer transformer =
                processor.NewXsltCompiler().Compile(new Uri(xsltUri)).Load();

            // Set the root node of the source document to be the initial context node
            transformer.InitialContextNode = input;

            // Set a parameter to the transformation
            transformer.SetParameter(new QName("", "", "greeting"),
                                     new XdmAtomicValue("hello"));

            // Create a serializer
            Serializer serializer = new Serializer();
            serializer.SetOutputWriter(Console.Out);
            serializer.SetOutputProperty(Serializer.INDENT, "yes");

            // Transform the source XML to Console.Out
            transformer.Run(serializer);
        }
    }
}