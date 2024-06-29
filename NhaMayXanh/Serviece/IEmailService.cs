using Microsoft.AspNetCore.Mvc;
using System.Net.Mime;


namespace NhaMayXanh.Serviece
{
    public interface IEmailService
    {
        Task SendEmailAsync(string toEmail, string subject, string body);
    }

    // Implementation using a specific email service provider would go here (replace with your actual implementation)
    public class MyEmailService : IEmailService
    {
        private readonly string _apiKey; // Replace with your actual API key

        public MyEmailService(string apiKey)
        {
            _apiKey = apiKey;
        }

        public async Task SendEmailAsync(string toEmail, string subject, string body)
        {
            //var client = new SendGridClient(_apiKey);
            //var fromEmail = "your_sender_email@example.com"; // Replace with your sender email
            //var fromName = "Your Application Name"; // Replace with your application name

            //var message = MailHelper.CreateSingleEmail(
            //    fromEmail,
            //    fromName,
            //    toEmail,
            //    subject,
            //    contentType: ContentType.Html,
            //    body: body);

            //var response = await client.SendEmailAsync(message);
        }
    }
}
