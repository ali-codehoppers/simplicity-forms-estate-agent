using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using System.Security.Cryptography;
using System.Text;
/// <summary>
/// Summary description for Utility
/// </summary>
public class Utility
{
    static public string GetMd5Sum(string str)
    {
        // First we need to convert the string into bytes, which
        // means using a text encoder.
        Encoder enc = System.Text.Encoding.Unicode.GetEncoder();

        // Create a buffer large enough to hold the string
        byte[] unicodeText = new byte[str.Length * 2];
        enc.GetBytes(str.ToCharArray(), 0, str.Length, unicodeText, 0, true);

        // Now that we have a byte array we can ask the CSP to hash it
        MD5 md5 = new MD5CryptoServiceProvider();
        byte[] result = md5.ComputeHash(unicodeText);

        // Build the final string by converting each byte
        // into hex and appending it to a StringBuilder
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < result.Length; i++)
        {
            sb.Append(result[i].ToString("X2"));
        }

        // And return it
        return sb.ToString();
    }

	public Utility()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public static string GetNameFromCategory(string fullName)
    {
        string[] seperator = new string[1];
        seperator[0] = " - ";
        string[] names = fullName.Split(seperator,StringSplitOptions.None);
        if (names.Length == 2)
        {
            return names[1];
        }
        return names[0];
    }

    public static DateTime GetTrialEndDate(DateTime startDate, int trialNumOfDays)
    {
        DateTime currentDate = startDate;
        int index = -1;
        while (index < trialNumOfDays)
        {
            if (currentDate.DayOfWeek != DayOfWeek.Saturday && currentDate.DayOfWeek != DayOfWeek.Sunday)
            {
                index++;
            }
            if (index < trialNumOfDays)
            {
                currentDate = currentDate.AddDays(1);
            }
        }
        return currentDate;
    }

}
