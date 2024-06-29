﻿using System;
using System.Collections.Generic;

namespace WebFigure.Models;

public partial class TbProduct
{
    public int ProductId { get; set; }  

    public string? ProductName { get; set; }

    public string? ShortDesc { get; set; }

    public string? Desciption { get; set; }

    public int? CatllD { get; set; }

    public int? Price { get; set; }

    public int? Discount { get; set; }

    public string? Thumb { get; set; }

    public DateTime? DateCreated { get; set; }

    public DateTime? DateModified { get; set; }

    public bool BestSellers { get; set; }

    public bool HomeFlag { get; set; }

    public bool Active { get; set; }

    public string? Tags { get; set; }

    public string? Title { get; set; }

    public string? Alias { get; set; }

    public string? MetaDesc { get; set; }

    public string? MetaKey { get; set; }

    public int? UnitslnStock { get; set; }

    public virtual TbCategory? CatllDNavigation { get; set; }
}
