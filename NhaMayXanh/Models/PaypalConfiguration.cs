using System.Collections.Generic;
using Microsoft.Extensions.Configuration;
using PayPal.Api;

namespace WebFigure.Models
{
    public static class PaypalConfiguration
    {
        //Variables for storing the clientID and clientSecret key  
        public readonly static string ClientId;
        public readonly static string ClientSecret;

        //Constructor  
        static PaypalConfiguration()
        {
            IConfiguration configuration = new ConfigurationBuilder()
                .AddJsonFile("appsettings.json", optional: true, reloadOnChange: true)
                .Build();

            ClientId = "ATZlyNCoWzBQFL-ueX-vjxFd0mgQBoUPq42DnZqFsimx2PmNOKzZO-r2TT8g2FE3z6TYD9WfMA9UQxk5"; //configuration["PayPal:clientId"];
            ClientSecret = "EJcLyQ4QpFck_6WiFmtKrLWElttzlVeDpMAtntzL1DwdPoHV9DSzwNTsNorzv1i63IQhno2cqkMlvPSq"; //configuration["PayPal:clientSecret"];
        }

        private static string GetAccessToken()
        {
            Dictionary<string, string> config = new Dictionary<string, string>();
            // getting accesstoken from paypal
            var item = new OAuthTokenCredential(ClientId, ClientSecret, config);
            string accessToken = item.GetAccessToken();
            return accessToken;
        }

        public static APIContext GetAPIContext()
        {
            // return apicontext object by invoking it with the accesstoken  
            APIContext apiContext = new APIContext(GetAccessToken());
            return apiContext;
        }
    }
}
