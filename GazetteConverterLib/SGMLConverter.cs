using System.Reflection;
using System.Text;
using System.Text.RegularExpressions;
using System.Xml;
using System.Xml.Linq;
using System.Xml.Xsl;

namespace GazetteConverterLib
{
    /// <summary>
    /// 四法の種別
    /// </summary>
    public enum Law
    {
        PATENT,
        UTILITY,
        DESIGN,
        TRADEMARK,
    }

    public interface ISGMLConverter
    {
        public void Convert(string srcPath, string dstPath);
    }

    /// <summary>
    /// SGML 公報を XML 公報に変換するオブジェクトを生成するクラス
    /// </summary>
    public static class SGML2XML
    {
        public static ISGMLConverter GetConverter(Law law)
        {
            switch (law)
            {
                case Law.TRADEMARK:
                    var fixer = new TMFixer();
                    return new TrademarkConverter(fixer);
                default:
                    return new NullConverter();
            }
        }
    }

    /// <summary>
    /// SGML 商標公報をXMLに変換するクラス
    /// </summary>
    class TrademarkConverter : ISGMLConverter
    {
        SGMLFixer fixer;

        public TrademarkConverter(SGMLFixer fixer)
        {
            this.fixer = fixer;
        }

        public void Convert(string srcPath, string dstPath)
        {
            // SGML 商標公報は EUC-JP
            var enc = Encoding.GetEncoding("euc-jp");

            string rawSgml;
            using (var sr = new StreamReader(srcPath, enc))
            {
                rawSgml = sr.ReadToEnd();
            }

            string sgml = fixer.Fix(rawSgml);

            var xmlDoc = new XmlDocument();
            xmlDoc.LoadXml(sgml);
            var tmType = TMTypeDetector.Detect(xmlDoc);

            // サブフォルダ XSLT にある xsltName のパス
            var xsltPath = Path.Combine(Path.GetDirectoryName(Assembly.GetEntryAssembly().Location), "xslt", "JPRegisteredTrademarkPublication.xslt");
            XslCompiledTransform xslt = new XslCompiledTransform();
            xslt.Load(xsltPath);

            XmlReaderSettings xrSettings = new XmlReaderSettings
            {
                DtdProcessing = DtdProcessing.Ignore,
            };
            using (StringReader sr = new(sgml))
            using(XmlReader xr = XmlReader.Create(sr, xrSettings))
            using (var outStream = new StreamWriter(dstPath, false, new UTF8Encoding(encoderShouldEmitUTF8Identifier: false)))
            {
                xslt.Transform(xr, null, outStream); ;
            }
        }
    }


    class NullConverter : ISGMLConverter
    {
        public void Convert(string srcPath, string dstPath)
        {
        }
    }

    enum TMType
    {
        REGISTRATION,
        PROTECTION,
        UNKNOWN
    }

    static class TMTypeDetector
    {
        public static TMType Detect(XmlDocument xmlDocument)
        {
            XmlNode? xmlNode = xmlDocument.SelectSingleNode("REGISTRATION-NUMBER");
            if (xmlNode != null && xmlNode.Attributes != null)
            {
                var tmType = xmlNode.Attributes.GetNamedItem("KIND-OF-REGISTRATION-NUMBER");
                if(tmType != null)
                {
                    switch (tmType.InnerText)
                    {
                        case "REGISTRATION": return TMType.REGISTRATION;
                        case "PROTECTION": return TMType.PROTECTION;
                        default: return TMType.UNKNOWN;
                    }
                } else
                {
                    return TMType.UNKNOWN;
                }
            }
            else
            {
                return TMType.UNKNOWN;
            }
        }
    }

    /// <summary>
    /// SGMLを修正するクラス
    /// </summary>
    abstract class SGMLFixer
    {
        protected readonly List<Regex> regex;

        public SGMLFixer()
        {
            regex = new List<Regex>();
        }

        public string Fix(string sgmlString)
        {
            string s = sgmlString;
            foreach (var r in regex)
            {
                s = r.Replace(s, @"$1/>");
            }

            return _Fix(s);
        }

        protected abstract string _Fix(string sgmlString);
    }

    class TMFixer : SGMLFixer
    {
        // 閉じタグがないタグ
        private readonly string[] regStrings = {
            "image",
            "ATTORNEY-RIGHT",
            "OBJECT-APPLICATION",
            "regional-trademark-indication",
            "collective-trademark-indication",
            "version-of-nice-class",
            "trademark-law-sec-3-2-applied",
            "trademark-law-sec-9-1-applied",
            "td-trademark-indication",
            "td-defensive-mark-indication",
            "sound-trademark-indication",
            "color-trademark-indication",
            "position-trademark-indication",
            "standard-character-indication",
            "motion-trademark-indication",};

        public TMFixer()
        {
            foreach (string regString in regStrings)
            {
                var r = $"(<{regString}[^>]*)>";
                var reg = new Regex(r, RegexOptions.IgnoreCase | RegexOptions.Multiline);
                regex.Add(reg);
            }
        }

        protected override string _Fix(string sgmlString)
        {
            // DOCTYPE が PUBLIC だとエラーで読み込めないので、SYSTEMに置き換えて無理矢理読み込む
            var re = new Regex("PUBLIC");
            return re.Replace(sgmlString, "SYSTEM", 1);
        }
    }
}
