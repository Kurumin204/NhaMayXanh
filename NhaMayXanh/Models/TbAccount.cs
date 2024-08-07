﻿using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;

namespace WebFigure.Models;

public partial class TbAccount
{
    [BindProperty]
    public int AccountId { get; set; }

    public string? Phone { get; set; }

    public string? Email { get; set; }

    public string? Password { get; set; }

    public string? Salt { get; set; }

    public bool Active { get; set; }

    public string? FullName { get; set; }

    public int? RoleId { get; set; }

    public DateTime? LastLogin { get; set; }

    public DateTime? CreateDate { get; set; }

    public virtual TbRole? Role { get; set; }

    public virtual ICollection<TbNews> TbNews { get; set; } = new List<TbNews>();
}
