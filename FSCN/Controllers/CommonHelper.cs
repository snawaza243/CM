using System;
using System.Web;
using System.Web.UI;

namespace FSCN.Controllers
{
    public class CommonHelper
    {
        /// <summary>
        /// Shows an alert message in ASP.NET WebForms, works for both full and partial postbacks.
        /// </summary>
        public void ShowAlert(Page page, string message)
        {
            if (page == null) throw new ArgumentNullException(nameof(page));

            // Escape single quotes in message
            string cleanMessage = message.Replace("'", "\\'");

            if (ScriptManager.GetCurrent(page) != null && ScriptManager.GetCurrent(page).IsInAsyncPostBack)
            {
                // Partial postback (inside UpdatePanel)
                ScriptManager.RegisterStartupScript(page, page.GetType(), "alert", $"alert('{cleanMessage}');", true);
            }
            else
            {
                // Full postback
                page.ClientScript.RegisterStartupScript(page.GetType(), "alert", $"alert('{cleanMessage}');", true);
            }
        }
    }
}
