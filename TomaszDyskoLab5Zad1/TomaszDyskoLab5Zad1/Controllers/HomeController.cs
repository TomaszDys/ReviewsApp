using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TomaszDyskoLab5Zad1.Models;

namespace TomaszDyskoLab5Zad1.Controllers
{
    public class HomeController : Controller
    {
        /// <summary>
        /// Metoda zwracająca widok strony głóównej
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            return View();
        }
        /// <summary>
        /// Metoda wzraca widok porównywania gier
        /// </summary>
        /// <returns></returns>
        public ActionResult Compare()
        {
            using (var context = new DatabaseContext())
            {
                var games = context.Games.ToList();
                return View(games);
            }
        }
        /// <summary>
        /// Metoda zwzraca widok porównywania gier
        /// </summary>
        /// <returns></returns>
        public ActionResult Create()
        {
            using (var context = new DatabaseContext())
            {
                return View();
            }
        }
        /// <summary>
        /// Metoda tworzy nową grę po wypełnieniu formularza
        /// </summary>
        /// <returns></returns>
        public ActionResult CreateGame(Game game)
        {
            using (var context = new DatabaseContext())
            {
                Game newGame = new Game();
                newGame = game;
                //Jeśli uda się dodać obiekt do bazy to podaję taką informację i przekierowywuję do spisu gier, jeśli nie to informuję o tym użytkownika oraz przenoszę go ponownie na stronę tworzenia
                try
                {
                    context.Games.Add(newGame);
                    context.SaveChanges();
                    return Content("<script language='javascript' type='text/javascript'>alert('Dodano grę!');window.location.replace('/Home/Compare');</script>");
                }
                catch
                {
                    return Content("<script language='javascript' type='text/javascript'>alert('Coś poszło nie tak! Spróbuj poonownie');window.location.replace('/Home/Create');</script>");
                }
            }
        }
        /// <summary>
        /// Metoda zwracająca widok strony recenzji wskazanej gry
        /// </summary>
        /// <returns></returns>
        public ActionResult Reviews(int? a)
        {
            using (var context = new DatabaseContext())
            {
                //zapisuje id gry przy której kliknięto napis
                TempData["Id"] = a;
                List<Review> newReviews = new List<Review>();
                var name = (from Games in context.Games where Games.Id == a select Games.Name).FirstOrDefault();
                TempData["GameName"] = name;
                //próbuję wyliczyć średnią, jeśli coś się nie powiedzie np. dzielenie przez 0 to przypisuję 0 do średniaej
                try
                {
                    int numberOfReviews = context.Reviews.Where(x => x.GameId == a).Include(x => x.Game).ToList().Count;
                    int sumOfStars = (from Reviews in context.Reviews where Reviews.GameId == a select Reviews.Stars).Sum();
                    TempData["Average"] = sumOfStars / numberOfReviews;
                }
                catch
                {
                    TempData["Average"] = 0;
                }
                newReviews = context.Reviews.Where(x => x.GameId == a).Include(x => x.Game).ToList();
                return View(newReviews);
            }
        }
        /* Opcja do dodania narazie nie działa
         public ActionResult CreateReview()
        {
            using (var context = new DatabaseContext())
            {
                return View();
            }
        }
        public ActionResult CreateReviewFunction(Review review)
        {
            using (var context = new DatabaseContext())
            {
                Review newGame = new Review();
                newGame = review;
                //Jeśli uda się dodać obiekt do bazy to podaję taką informację i przekierowywuję do spisu gier, jeśli nie to informuję o tym użytkownika oraz przenoszę go ponownie na stronę tworzenia
                try
                {
                    context.Reviews.Add(newGame);
                    context.SaveChanges();
                    return Content("<script language='javascript' type='text/javascript'>alert('Dodano grę!');window.location.replace('/Home/Compare');</script>");
                }
                catch
                {
                    return Content("<script language='javascript' type='text/javascript'>alert('Coś poszło nie tak! Spróbuj poonownie');window.location.replace('/Home/Create');</script>");
                }
            }
        }*/
        /// <summary>
        /// Metoda zwracająca widok strony o mnie
        /// </summary>
        /// <returns></returns>
        public ActionResult About()
        {
            return View();
        }
        /// <summary>
        /// Metoda zwracająca widok strony kontaktowej 
        /// </summary>
        /// <returns></returns>
        public ActionResult Contact()
        {
            return View();
        }
        /// <summary>
        /// Metoda tworząca kontakt i dodająca go do bazy danych
        /// </summary>
        /// <param name="messages"></param>
        /// <returns></returns>
        public ActionResult CreateContact(Messages messages)
        {
            using (var context = new DatabaseContext())
            {
                context.Messages.Add(messages);
                context.SaveChanges();
                //Pokazuję informacje, że udało się dodać wiadomość i przekierowuję na stronę główną
                return Content("<script language='javascript' type='text/javascript'>alert('Wysłano wiadomość odpowiemy niedługo!');window.location.replace('/Home');</script>");
            }
        }
    }
}