﻿namespace WebFigure.ModelsView
{
    public class MuaHangSuccessVM
    {
        public string? DonHangID { get; set; }
        public string? FullName { get; set; }
        public string? Phone { get; set; }
        public string? Address { get; set; }

        public List<CartItem> CartItems { get; set; }
        //public string? PhuongXa { get; set; }
        //public string? QuanHuyen { get; set; }
        // public string? TinhThanh { get; set; }
    }

}
