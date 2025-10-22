using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;

namespace CMC.Helper
{
    public class CommonHelper
    {

        public static string CreateJsonResponse(bool success, string message)
        {
            return JsonConvert.SerializeObject(new
            {
                success,
                message
            }, Formatting.None);
        }

        public static Dictionary<string, object> ConvertDataRowToDictionary(DataRow row)
        {
            var dict = new Dictionary<string, object>();
            foreach (DataColumn col in row.Table.Columns)
            {
                dict[col.ColumnName] = row[col] is DBNull ? null : row[col];
            }
            return dict;
        }

        public static byte[] GetImageBytes(string imageSource, string imgType = "p", bool resize = true)
        {
            if (string.IsNullOrEmpty(imageSource))
                throw new ArgumentException("Image source cannot be null or empty.", nameof(imageSource));

            byte[] imageBytes;

            // Check if the input is a Base64 image (data URL)
            if (imageSource.StartsWith("data:image"))
            {
                string base64Data = imageSource.Substring(imageSource.IndexOf(",") + 1);
                imageBytes = Convert.FromBase64String(base64Data);
            }
            else if (File.Exists(imageSource))
            {
                // It's a file path
                imageBytes = File.ReadAllBytes(imageSource);
            }
            else
            {
                //throw new FileNotFoundException("Image file not found or invalid data URL.", imageSource);
                return null;
            }

            // Resize if needed
            using (MemoryStream ms = new MemoryStream(imageBytes))
            using (Image image = Image.FromStream(ms))
            using (MemoryStream msOut = new MemoryStream())
            {
                Size targetSize = image.Size;

                if (resize)
                {
                    switch (imgType.ToLower())
                    {
                        case "p": targetSize = new Size(300, 300); break; // Profile
                        case "c": targetSize = new Size(200, 200); break; // Company
                        case "i": targetSize = new Size(600, 800); break; // ID
                    }

                    using (Bitmap resized = new Bitmap(image, targetSize))
                    {
                        resized.Save(msOut, image.RawFormat);
                    }
                }
                else
                {
                    image.Save(msOut, image.RawFormat);
                }

                return msOut.ToArray();
            }
        }

        // Helper to get encoder for JPEG compression
        private static ImageCodecInfo GetEncoder(ImageFormat format)
        {
            return ImageCodecInfo.GetImageDecoders().FirstOrDefault(codec => codec.FormatID == format.Guid);
        }


        public static byte[] GetImageBytes_0(string imagePath, string imgType="p")
        {
            /*
                Image Type	    Suggested Max Size	    Example Dimension
                Profile photo	≤ 200 KB	            300×300 px
                Company logo	≤ 100 KB	            200×200 px
                ID photo/doc	≤ 500 KB	            600×800 px

            Note: p = profile, c = company, i = id
             
             */
            if (string.IsNullOrEmpty(imagePath) || !File.Exists(imagePath))
                throw new FileNotFoundException("Image file not found.", imagePath);

            using (Image image = Image.FromFile(imagePath))
            using (MemoryStream ms = new MemoryStream())
            {
                // Choose the correct image format based on extension
                ImageFormat format = GetImageFormat(imagePath);
                image.Save(ms, format);
                return ms.ToArray();
            }
        }

        private static ImageFormat GetImageFormat(string path)
        {
            string ext = Path.GetExtension(path).ToLower();
            switch (ext)
            {
                case ".jpg":
                case ".jpeg":
                    return ImageFormat.Jpeg;
                case ".png":
                    return ImageFormat.Png;
                case ".bmp":
                    return ImageFormat.Bmp;
                case ".gif":
                    return ImageFormat.Gif;
                case ".ico":
                    return ImageFormat.Icon;
                default:
                    return ImageFormat.Png; // Default format
            }
        }

        private string ConvertBytesToImage(object blobObj)
        {
            if (blobObj == DBNull.Value) return null;

            byte[] blobData = (byte[])blobObj;
            return "data:image/png;base64," + Convert.ToBase64String(blobData);
        }

        public static byte[] ResizeImage(string imagePath, int width, int height)
        {
            using (var originalImage = Image.FromFile(imagePath))
            {
                var resized = new Bitmap(width, height);
                using (var graphics = Graphics.FromImage(resized))
                {
                    graphics.CompositingQuality = CompositingQuality.HighQuality;
                    graphics.InterpolationMode = InterpolationMode.HighQualityBicubic;
                    graphics.CompositingMode = CompositingMode.SourceCopy;
                    graphics.DrawImage(originalImage, 0, 0, width, height);
                }

                using (var ms = new MemoryStream())
                {
                    resized.Save(ms, ImageFormat.Jpeg);
                    return ms.ToArray();
                }
            }
        }

    }
}