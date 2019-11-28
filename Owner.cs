using System;

namespace SKK13
{
    public class Owner
    {
        public string Namn { get; set; }
        string connStr = "Server=40.85.84.155;Database=SKK13;User=Student13;Password=YH-student@2019;";

        public void SearchOwner()
        {
            Menu M = new Menu();
            var db = new DB(connStr);
            int input = 0;

            while (true)
            {
                Console.Write("Ange ditt ägar-Id: (ta 1 för testets skull): ");
                try
                {
                    input = M.TryToConvertToInt(Console.ReadLine());
                }
                catch
                {
                    M.PressAnyKey();
                    continue;
                }
                var owner = db.SearchOwner(input);
                Console.WriteLine($"Ägaren heter:{owner.Namn}");
                M.PressAnyKey();
                return;
            }
        }
    }
}