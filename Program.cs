using System;

namespace SKK13
{
    class Program
    {
        static void Main(string[] args)
        {
            Menu M = new Menu();
            Dog D = new Dog();
            Owner O = new Owner();
            M.StartMenu(D, O);
        }
    }
}