using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;
using System.Text;

/// <summary>
/// Summary description for MessageFactory
/// </summary>

public static class Messages
{
    public enum Info
    {
        SAVED_SUCCESSFULLY,
        UPDATED_SUCCESSFULLY,
        DELETED_SUCCESSFULLY
    }
    public enum Error
    {
        SESSION_EXPIRED
    }
}

public class MessageFactory
{
    private Dictionary<Messages.Error, string> errorMessages = new Dictionary<Messages.Error, string>();
    private Dictionary<Messages.Info, string> infoMessages = new Dictionary<Messages.Info, string>();
    private static MessageFactory instance = new MessageFactory();
	private MessageFactory()
	{
        //Info Messages
        infoMessages.Add(Messages.Info.SAVED_SUCCESSFULLY, "Record Added Successfully");
        infoMessages.Add(Messages.Info.UPDATED_SUCCESSFULLY, "Record Updated Successfully");
        infoMessages.Add(Messages.Info.DELETED_SUCCESSFULLY, "Record Delete Successfully");

        //Error Messages
	}

    public static MessageFactory Instance
    {
        get
        {
            return instance;
        }
    }

    public string GetInfoMessageString(Messages.Info info)
    {        
        return WebConstants.Request.INFO_MSG + "="+ ((int)info).ToString();        
    }

    public string GetErrorMessageString(Messages.Error error)
    {
        return WebConstants.Request.ERROR_MSG + "=" + ((int)error).ToString();        
    }

    public string GetInfoMessage(Messages.Info info)
    {
        return infoMessages[info];
    }
    
    public string GetErrorMessage(Messages.Error error)
    {
        return errorMessages[error];
    }
}
