
using WebFigure.Models;

namespace WebFigure.ModelsView { 

public class CartItem
{
    public TbProduct product { get; set; }
    public int amount { get; set; }
    public double TotalMoney => amount * product.Price.Value;
}

}
