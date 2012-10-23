using System;
using System.Collections;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;

/// <summary>
/// Summary description for Registeration
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
public class Registeration : System.Web.Services.WebService {

    public Registeration () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string HelloWorld() {
        return "Hello World";
    }
    
}

