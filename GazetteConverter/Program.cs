using GazetteConverterLib;
using System.Text;

string srcPath = @"R:\local_develop\商標解析\商標公報\DOCUMENT\TG\6481001\6481001\6481001\6481006.IMG";
string dstPath = @"R:\local_develop\商標解析\商標公報\DOCUMENT\TG\6481001\6481001\6481001\6481006.JPG";
string srcSgml = @"R:\local_develop\商標解析\商標公報\DOCUMENT\TG\6481001\6481001\6481001\6481006.SGM";
string dstSgml = @"R:\local_develop\商標解析\商標公報\DOCUMENT\TG\6481001\6481001\6481001\6481006.XML";

//var conv = new ImageConverter();
//conv.Convert(srcPath, dstPath);

Encoding.RegisterProvider(CodePagesEncodingProvider.Instance);
var c = SGML2XML.GetConverter(Law.TRADEMARK);
c.Convert(srcSgml, dstSgml);
