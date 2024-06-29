using System;
using System.Collections.Generic;
using WebFigure.Models;
namespace WebFigure.ModelsView
{
    public class HomeViewVM
    {
        public List<TbNews> news { get; set; }
        public List<ProductHomeVM>? Products { get; set; }
      
    }
}

