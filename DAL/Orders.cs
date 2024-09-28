using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Linq.Mapping;

namespace DAL
{
    [Table(Name = "Orders")]
    public class Orders
    {
        [Column(IsPrimaryKey = true)]
        public int OrderID { set; get; }

        [Column]
        public int SellerID { set; get; }

        [Column]
        public int CustomerID { set; get; }

        [Column]
        public int ProductID { set; get; }

        [Column]
        public int Quantity { set; get; }

        [Column]
        public string OrderStatus { set; get; }

    }
}
