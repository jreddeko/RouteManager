using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using Wddc.Data;
using Wddc.Services.Members;

namespace RouteManagement.Controllers
{
    public class MapController : Controller
    {
        // GET: Map
        public async Task<ActionResult> Index()
        {
            var mapService = new MapService();
            var memberService = new MemberService();
            var mapCoordinates = mapService.GetAll();
            var members = memberService.GetAll(Wddc.Core.Entities.Members.SetupState.Complete);

            members = members
                .Select(m =>
                {
                    m.MapCoordinates = mapCoordinates.SingleOrDefault(mc => mc.MemberNumber == m.Id);
                    return m;
                }).ToList();


            var model = members.Where(m => m.MapCoordinates != null )
                .Select(x => new ViewModels.MapViewModels.IndexViewModel()
            {
                lat = x.MapCoordinates.Lat,
                lng = x.MapCoordinates.Long,
                Name = x.Information?.Name,
                Route = x.Route.RouteNumber.ToString()
            });
            var f = model.ToList();
            return View(model.ToList());
        }
    }
}