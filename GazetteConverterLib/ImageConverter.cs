using OpenCvSharp;

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
        /// srcPath を読込 dstPath に書き込む。ファイル名の拡張子で自動的にフォーマット変換される。
        /// </summary>
        /// <param name="srcPath">変換する対象のイメージファイルへのパス</param>
        /// <param name="dstPath">変換後のイメージファイルへのパス</param>
        public void Convert(string srcPath, string dstPath)
        {
            var img = new Mat(srcPath);
            Cv2.ImWrite(dstPath, img);
        }
    }
}