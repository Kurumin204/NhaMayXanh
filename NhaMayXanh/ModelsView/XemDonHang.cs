using WebFigure.Models;

namespace WebFigure.ModelsView
{
    public class XemDonHang
    {
        public TbOrder? DonHang { get; set; }
        public List<TbOrderDetaill>? ChiTietDonHang { get; set; }
    }
}
