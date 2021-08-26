using System;
using System.Collections.Generic;
using System.Linq;
using TodoMaui.Models;

namespace TodoMaui.Repositories
{
    public class TodoRepository
    {
        private TodoRepository() { }

        private static TodoRepository instance = null;
        public static TodoRepository Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new TodoRepository();
                }
                return instance;
            }
        }

        private List<TodoItem> _todoItems = new List<TodoItem>();

        public List<TodoItem> GetItems()
        {
            return _todoItems.ToList();
        }

        public List<TodoItem> GetItemsNotDone()
        {
            return _todoItems.Where(s => s.Done == false).ToList();
        }

        public TodoItem GetItem(Guid id)
        {
            return _todoItems.Where(i => i.ID == id).FirstOrDefault();
        }

        public Guid SaveItem(TodoItem item)
        {
            if (item.ID != Guid.Empty)
            {
                _todoItems.Remove(item);
                _todoItems.Add(item);
                return item.ID;
            }
            else
            {
                item.ID = Guid.NewGuid();
                _todoItems.Add(item);
                return item.ID;
            }
        }

        public void DeleteItem(TodoItem item)
        {
            _todoItems.Remove(item);
        }
    }
}
