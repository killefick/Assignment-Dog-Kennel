using System;

namespace SKK13
{
    public class Dog
    {
        public int Id { get; set; }
        public string Namn { get; set; }
        public string Ras { get; set; }
        public string Kön { get; set; }
        public string Färg { get; set; }
        public string Storlek { get; set; }
        public string Hårlag { get; set; }
        public string TT_Id { get; set; }
        public string ChipNr { get; set; }
        public int Ägar_Id { get; set; }
        public int Uppfödare_Id { get; set; }
        public int Saknad { get; set; }
        public int Hittad { get; set; }

        public void GetAllDogs()
        {
            var db = new DB();

            foreach (var dog in db.GetAllDogsDB())
            {
                Console.WriteLine($"Id: {dog.Id}\nNamn: {dog.Namn} \nRas: {dog.Ras} \nKön: {dog.Kön} \nFärg: {dog.Färg} \nHårlag: {dog.Hårlag} \nStorlek: {dog.Storlek}\n");
            }
        }

        public int CountAllDogs()
        {
            var db = new DB();

            int numberOfDogs = db.CountAllDogsDB();
            return numberOfDogs;
        }

        public int CountVeterinaryData()
        {
            var db = new DB();

            int vetInfo = db.CountVeterinaryInfoDB();
            return vetInfo;
        }

        public void GetDogInfo(int id)
        {
            var db = new DB();

            foreach (var dog in db.GetDogInfoDB(id))
            {
                Console.WriteLine($"Namn: {dog.Namn} \nRas: {dog.Ras} \nKön: {dog.Kön} \nFärg: {dog.Färg} \nHårlag: {dog.Hårlag} \nStorlek: {dog.Storlek}\n");
            }
        }

        public void GetSyblings()
        {
            var db = new DB();

            foreach (var dog in db.GetSyblingsDB())
            {
                Console.WriteLine($"Namn: {dog.Namn}");
            }
        }
    }
}