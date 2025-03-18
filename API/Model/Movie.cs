using Microsoft.AspNetCore.Http.HttpResults;
using System.Xml.Linq;

namespace API.Model
{
    public class Movie
    {
        public int id { get; set; }
        public string name { get; set; }
        public string release { get; set; }
        public string IMDBRating { get; set; }
        public string timing { get; set; }
        public string description { get; set; }
    }
}
