using WebFigure.Models;

namespace WebFigure.ModelsView
{
    public class ProductHomeVM
    {
        public TbCategory category { get; set; }
        public List<TbProduct> lsProducts { get; set; }
    }
}
