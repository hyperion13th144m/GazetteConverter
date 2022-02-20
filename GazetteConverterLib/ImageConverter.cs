using OpenCvSharp;
using System.IO;

namespace GazetteConverterLib
{
    /// <summary>
    /// 公報に含まれる画像ファイルをjpegなどに変換するクラス
    /// </summary>
    public class ImageConverter
    {
        public ImageConverter()
        {
        }

        /// <summary>
        /// srcPath を読込み、srcPathと同じフォルダに
        /// Path.GetFilenameWithoutExtension(srcPath)-{i.ToString(format)}.jpgを作成する。
        /// i は srcPath内の画像の通し番号。シングルorマルチtiffに関わらず、通し番号が付く。
        /// </summary>
        /// <param name="srcPath">変換する対象のイメージファイルへのパス</param>
        /// <param name="format">numberに適用するフォーマット</param>
        public void Convert(string srcPath, string format="000000")
        {
            Mat[] img;
            var dir = Path.GetDirectoryName(srcPath);
            var basename = Path.GetFileNameWithoutExtension(srcPath);

            Cv2.ImReadMulti(srcPath, out img);
            int i = 1;
            foreach (Mat m in img)
            {
                string f = Path.Combine(dir, $"{basename}-{i.ToString(format)}.jpg");
                Cv2.ImWrite(f, m);
                i++;
            }
        }
    }
}