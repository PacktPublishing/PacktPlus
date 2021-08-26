using System;

namespace TodoMaui.Models
{
    public class TodoItem
    {
        public Guid ID { get; set; }
        public string Name { get; set; }
        public string Notes { get; set; }
        public bool Done { get; set; }
    }
}
