using System;
using System.Collections.Generic;
using System.Configuration;
using System.Diagnostics;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace BaseLibraries.Repository
{
    public class SendMailRepository : ISendMailRepository
    {
        public SendMailRepository()
        {
            isDebug = Convert.ToBoolean( ConfigurationManager.AppSettings["Debug"]);

        }
        bool isDebug = false;
        string pattern = @"/^\S+@\S+\.\S+$/";
        string bodyHTML = "<!DOCTYPE html><html> <head> <title>TODO supply a title</title> <meta charset='UTF-8'> <meta name='viewport' content='width=device-width, initial-scale=1.0'> <style> *{ box-sizing: border-box; } body{ margin: 0; padding: 0; font-family: sans-serif; font-size: 14px; } h2{ border-bottom: 1px solid #ddd; padding: 15px 15px; margin: 0; } .wrapper{ padding: 20px 2px; } .page{ background: #fff; padding: 10px 0; box-shadow: 0 0 5px #7650A1; } .page, .row{ margin: 0 auto; max-width: 980px; } .container{ padding: 15px; } .container:after{ content: ' '; display: block; clear: both; } dt{ font-weight: bold; float: left; margin-right: 3px; clear: left; } dt:after{ content: ':'; } dd{ margin: 0 0 5px; }dl dd:after{ display: table; content: ' '; clear: both;} ul{ margin: 0; } ul li{ display: inline-block; } ul li:after{ content: ','; } ul li:last-child:after{ content: ''; } article{ border-bottom: 1px solid #eee; } article time{ float: right; color: #888; } button{ padding: 10px 25px; background: #5cb85c; border: 1px solid #4cae4c; border-radius: 0; color: #fff; } button:hover{ background-color: #449d44; border-color: #398439; cursor: pointer; } footer { font-size: 80%; background: #7650A1; color: #fff; } .brand{ padding: 10px 0 10px; } </style> </head> <body> <header> <div class='row'> <div class='brand'> <img src='data:image/png;base64,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'> </div> </div> </header> <div class='wrapper'> <div class='page'>";

        string MessageName = "Комментарий к звонку";
        public bool SendMail(string[] to, string body, string title, string link = null, string mess_name = null)
        {
            try
            {
                if(isDebug)
                {
                    to = new string[] { "n.sibiryakov@clinic23.ru", "i.novokreshchenova@clinic23.ru" };
                }

                if (!string.IsNullOrWhiteSpace(mess_name))
                {
                    MessageName = mess_name.Trim();
                }
                string footerHTML = (link == null ? "" :
                string.Format(@"<div class='container'><a href='{0}'>
                    <button>Открыть запись</button></a> </div></div></div> <footer> <div class='container'>
                        <div class='row'> <p>Сообщение сформировано автоматически, пожалуйста не отвечайте на него и не пересылайте, т.к. в нём содержится информация об авторизации.</p></div> </div>
                        </footer> </body></html>", link));

                using (SmtpClient client = new SmtpClient())
                {
                    client.Port = 25;
                    client.Host = "mail.clinic23.ru";
                    client.EnableSsl = false;
                    client.Timeout = 10000;
                    client.DeliveryMethod = SmtpDeliveryMethod.Network;
                    client.UseDefaultCredentials = false;
                    client.Credentials = new System.Net.NetworkCredential("nobody1@clinic23.ru", "123789");
                    //  users = new string[] { "7" };
                    Regex regex = new Regex(pattern);
                    foreach (string mail in to)
                    {
                        bool isMail = regex.Match(mail).Groups.Count > 0;

                        if (isMail)
                        {
                            using (MailMessage mm = new MailMessage(MessageName + "<nobody1@clinic23.ru>", mail))
                            {
                                mm.BodyEncoding = UTF8Encoding.UTF8;
                                mm.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure;

                                mm.Subject = title;
                                mm.Body += bodyHTML;
                                mm.Body += body;
                                mm.Body += footerHTML;

                                mm.IsBodyHtml = true;

                                client.Send(mm);
                            }
                        }

                    }
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex.Message);
                return false;
            }
            return true;
        }
    }

    public interface ISendMailRepository
    {
        bool SendMail(string[] to, string body, string title, string link = null, string mess_name = null);
    }
}
