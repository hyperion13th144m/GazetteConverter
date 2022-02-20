using GazetteConverterLib;
using System.Text;

string srcPath = @"test\MOTION(5817942).IMG";
string dstPath = @"test\6481006.JPG";
string srcSgml = @"test\MOTION(5817942).SGM";
string dstXml = @"test\MOTION(5817942).XML";

var conv = new ImageConverter();
conv.Convert(srcPath);

Encoding.RegisterProvider(CodePagesEncodingProvider.Instance);
var c = SGML2XML.GetConverter(Law.TRADEMARK);
c.AddImagePrefix(Path.GetFileNameWithoutExtension(srcSgml));
c.Convert(srcSgml, dstXml);
// TODO: xml, sgml のバージョン考慮する
// xslt の冗長なtemplateをまとめる
// sgml converter クラスをすっきりとする。
