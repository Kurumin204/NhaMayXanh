using WebFigure.Models;
using WebFigure.Models.Momo;

namespace WebFigure.Services;
public interface IMomoService
{
    Task<MomoCreatePaymentResponseModel> CreatePaymentAsync(TbOrder model);
    MomoExecuteResponseModel PaymentExecuteAsync(IQueryCollection collection);
}
