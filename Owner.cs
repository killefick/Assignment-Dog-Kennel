using System;

namespace SKK13
{
    public class Owner
    {
        public string Namn { get; set; }
        public string Adress { get; set; }
        public string Telefon { get; set; }
        public string Mobil { get; set; }
        public string ArbTele { get; set; }

        public void SearchOwner()
        {
            Menu M = new Menu();
            var db = new DB();
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
                var owner = db.SearchOwnerDB(input);
                Console.WriteLine($" Ägare:\n {owner.Namn}\n {owner.Adress}\n {owner.Telefon}");
                return;
            }
        }
    }
}