using GazetteConverterLib;
using System.Text;

string srcPath = @"test\6481006.IMG";
string dstPath = @"test\6481006.JPG";
string srcSgml = @"test\CHARACTER(6481006).SGM";
string dstXml =  @"test\CHARACTER(6481006).XML";

//var conv = new ImageConverter();
//conv.Convert(srcPath, dstPath);

Encoding.RegisterProvider(CodePagesEncodingProvider.Instance);
var c = SGML2XML.GetConverter(Law.TRADEMARK);
c.Convert(srcSgml, dstXml);
// TODO: xml, sgml のバージョン考慮する

