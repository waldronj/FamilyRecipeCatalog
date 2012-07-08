using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;
using IngredientCatalog;
using System.Net.Mail;
using System.Net;

namespace IngredientCatalog
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
        }

        void Application_End(object sender, EventArgs e)
        {
            //  Code that runs on application shutdown

        }

        void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an unhandled error occurs
            Exception objErr = Server.GetLastError().GetBaseException();
            string err = string.Format("<strong>Error in:</strong> <br/>{0}<br /><strong>Error Message:</strong><br />{1}<br  /><strong>Stack:</strong><br />{2}", Request.Url.ToString(), 
                                                objErr.Message.ToString(), objErr.StackTrace.ToString());
                       
            //email me the error
            MailMessage email = new MailMessage("jwaldron@thejwal.com", "jwaldron@thejwal.com", "Error From the Recipe Catalog", err );
            email.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient("mail.thejwal.com");        
            smtp.UseDefaultCredentials = false;
            //smtp.Credentials = smtpCreds;


            email.Priority = MailPriority.High;

            smtp.Send(email);

        }

        void Session_Start(object sender, EventArgs e)
        {
            // Code that runs when a new session is started

        }

        void Session_End(object sender, EventArgs e)
        {
            // Code that runs when a session ends.
            // Note: The Session_End event is raised only when the sessionstate mode
            // is set to InProc in the Web.config file. If session mode is set to StateServer
            // or SQLServer, the event is not raised.

        }
    }
}
