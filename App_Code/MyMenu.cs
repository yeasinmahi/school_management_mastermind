using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace App_Code
{
    public class MyMenu
    {
        public int Id { get; set; }
        public string MenuTitle { get; set; }
        public string MenuUrl { get; set; }
        public int ParentId { get; set; }
        public char HasChild { get; set; }
        public List<MyMenu> ChildList { get; set; }


        public MyMenu()
        {
            ChildList = new List<MyMenu>();
        }
    }
}