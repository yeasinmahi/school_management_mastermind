using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

/// <summary>
/// Summary description for Subscription
/// </summary>
public class Subscription
{
	public string SubcriptionCheck()
	{
        //@=>eqm5cJ4zQLCANnRr5m0CSA==
        //~=>Cl+wojsp3dPyGwIuWFhzUg==
		SWISDataContext db=new SWISDataContext();
	    string decryptValue = "";
	    var getValue = db.SyestemSies.FirstOrDefault(x => x.Id==1);
        if (getValue != null)
	    {
	        decryptValue=Decrypt(getValue.SysCode);
	        int yr = Convert.ToInt32(decryptValue.Substring(1, 4));
            int mnt = Convert.ToInt32(decryptValue.Substring(5, 2));
            int day= Convert.ToInt32(decryptValue.Substring(7, 2));
            if (decryptValue.Equals("~" + decryptValue.Substring(1, 4) + decryptValue.Substring(5, 2) + decryptValue.Substring(7, 2)))
            {
                DateTime date = new DateTime(yr, mnt, day);
                if (DateTime.Now > date)
                {
                    getValue.SysCode = Encrypt("@" + decryptValue.Substring(1, 4) + decryptValue.Substring(5, 2) + decryptValue.Substring(7, 2));
                    db.SubmitChanges();
                    return "Error";
                }
                return "Success";
            }
	    }
	    else
	    {
            DateTime date = new DateTime(2018, 01, 25);
            if (DateTime.Now > date)
            {
                SyestemSy sys=new SyestemSy();
                sys.SysCode = Encrypt("@"+"2018"+"01"+"25");
                db.SyestemSies.InsertOnSubmit(sys);
                db.SubmitChanges();
                return "Error";
            }
            if (DateTime.Now <= date)
            {
                SyestemSy sys = new SyestemSy();
                sys.SysCode = Encrypt("~" + "2018" + "01" + "25");
                db.SyestemSies.InsertOnSubmit(sys);
                db.SubmitChanges();
                return "Success";
            }
            //return "Success";
	    }

        return "Error";
	}
    private string Encrypt(string clearText)
    {
        string EncryptionKey = "MAKV2SPBNI97710";
        byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
        using (Aes encryptor = Aes.Create())
        {
            Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
            encryptor.Key = pdb.GetBytes(32);
            encryptor.IV = pdb.GetBytes(16);
            using (MemoryStream ms = new MemoryStream())
            {
                using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                {
                    cs.Write(clearBytes, 0, clearBytes.Length);
                    cs.Close();
                }
                clearText = Convert.ToBase64String(ms.ToArray());
            }
        }
        return clearText;
    }
    private string Decrypt(string cipherText)
    {
        string EncryptionKey = "MAKV2SPBNI97710";
        byte[] cipherBytes = Convert.FromBase64String(cipherText);
        using (Aes encryptor = Aes.Create())
        {
            Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
            encryptor.Key = pdb.GetBytes(32);
            encryptor.IV = pdb.GetBytes(16);
            using (MemoryStream ms = new MemoryStream())
            {
                using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
                {
                    cs.Write(cipherBytes, 0, cipherBytes.Length);
                    cs.Close();
                }
                cipherText = Encoding.Unicode.GetString(ms.ToArray());
            }
        }
        return cipherText;
    }
}