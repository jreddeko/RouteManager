using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using RouteManagement.Controllers;
using System.Web.Mvc;
using RouteManagement.ViewModels.MemberViewModels;
using System.Linq;
using RouteManagement.Exceptions;
using Wddc.Extensions;
using Wddc.Core.Entities.Members;
using RouteManagement.ViewModels;

namespace RouteManagement.Tests.Controllers
{
    [TestClass]
    public class MemberControllerTests : RouteManagementTest
    {
        private MemberController controller = new MemberController();

        [TestMethod]
        public void Index_CheckAllComplete()
        {
            var dropdownlist = new DropDownListViewModel()
            {
                SelectedValue = "Complete",
            };
            var result = controller.Index(null, null, dropdownlist).Result as ViewResult;
            Assert.IsNotNull(result, "Result null check");
            var model = result.Model as IndexViewModel;
            Assert.IsNotNull(model, "Cast to model null check");
            Assert.IsTrue(model.Members.All(m => m.SetupState == SetupState.Complete));
            while (model.NextID != null)
            {
                result = controller.Index(null, model.NextID, dropdownlist).Result as ViewResult;
                Assert.IsNotNull(result, "Result null check");
                model = result.Model as IndexViewModel;
                Assert.IsNotNull(model, "Cast to model null check");
                Assert.IsTrue(model.Members.All(m => m.SetupState == SetupState.Complete));
            }
        }

        [TestMethod]
        public void Index_CheckAllPendingShippingSetup()
        {
            var dropdownlist = new DropDownListViewModel()
            {
                SelectedValue = "PendingShippingSetup",
            };
            var result = controller.Index(null, null, dropdownlist).Result as ViewResult;
            Assert.IsNotNull(result, "Result null check");
            var model = result.Model as IndexViewModel;
            Assert.IsNotNull(model, "Cast to model null check");
            Assert.IsTrue(model.Members.All(m => m.SetupState == SetupState.PendingShippingSetup));
            while (model.NextID != null)
            {
                result = controller.Index(null, model.NextID, dropdownlist).Result as ViewResult;
                Assert.IsNotNull(result, "Result null check");
                model = result.Model as IndexViewModel;
                Assert.IsNotNull(model, "Cast to model null check");
                Assert.IsTrue(model.Members.All(m => m.SetupState == SetupState.PendingShippingSetup));
            }
        }

        [TestMethod]
        public void Index_2()
        {
            var result = controller.Index("impact", null, null).Result as ViewResult;
            Assert.IsNotNull(result, "Result null check");
            var model = result.Model as IndexViewModel;
            Assert.IsNotNull(model, "Cast to model null check");
            Assert.IsTrue(model.Members.All(m => m.Information.Name.Contains("impact", StringComparison.InvariantCultureIgnoreCase)));
        }

        /// <summary>
        /// Try to add a member thats already been added.
        /// </summary>
        [TestMethod]
        [ExpectedException(typeof(AggregateException))]
        public void Add_SetupState_Complete_1()
        {
            var service = new Wddc.Services.Members.MemberService();
            var members = service.GetAll(Wddc.Core.Entities.Members.SetupState.Complete);
            var member = members.First();
            var result = controller.Add(member.Id).Result as ViewResult;
            Assert.IsNotNull(result, "Result null check");
            var model = result.Model as AddViewModel;
            Assert.IsNotNull(model, "Cast to model null check");
            Assert.IsTrue(model.MemberNumber == member.Id);
            Assert.IsTrue(model.PetFoodDropDownList != null);
            Assert.IsTrue(model.RouteDropDownList != null);
            Assert.IsTrue(model.DelayedBillingDropDownList != null);
        }
        /// <summary>
        /// Try to add a member thats already been added.
        /// </summary>
        [TestMethod]
        [ExpectedException(typeof(AggregateException))]
        public void Add_SetupState_PendingShipping_1()
        {
            var service = new Wddc.Services.Members.MemberService();
            var members = service.GetAll(Wddc.Core.Entities.Members.SetupState.PendingShippingSetup);
            var member = members.First();
            var result = controller.Add(member.Id).Result as ViewResult;
            Assert.IsNotNull(result, "Result null check");
            var model = result.Model as AddViewModel;
            Assert.IsNotNull(model, "Cast to model null check");
            Assert.IsTrue(model.MemberNumber == member.Id);
            Assert.IsTrue(model.PetFoodDropDownList != null);
            Assert.IsTrue(model.RouteDropDownList != null);
            Assert.IsTrue(model.DelayedBillingDropDownList != null);
        }

        [TestMethod]
        public void Add_Get_1()
        {
            var service = new Wddc.Services.Members.MemberService();
            var members = service.GetAll(Wddc.Core.Entities.Members.SetupState.PendingRoutingSetup);
            foreach (var member in members.Take(50))
            {
                var result = controller.Add(member.Id).Result as ViewResult;
                Assert.IsNotNull(result, "Result null check");
                var model = result.Model as AddViewModel;
                Assert.IsNotNull(model, "Cast to model null check");
                Assert.IsTrue(model.MemberNumber == member.Id);
                Assert.IsNotNull(model.MemberName == member.Information.Name);
                Assert.IsNotNull(model.PetFoodDropDownList);
                Assert.IsNotNull(model.RouteDropDownList);
                Assert.IsNotNull(model.DelayedBillingDropDownList);
            }
        }

        [TestMethod]
        public void Edit_Get_1()
        {
            var service = new Wddc.Services.Members.MemberService();
            var members = service.GetAll(Wddc.Core.Entities.Members.SetupState.Complete);
            foreach (var member in members.Take(50))
            {
                var result = controller.Edit(member.Id).Result as ViewResult;
                Assert.IsNotNull(result, "Result null check");
                var model = result.Model as EditViewModel;
                Assert.IsNotNull(model, "Cast to model null check");
                Assert.IsTrue(model.MemberNumber == member.Id);
                Assert.IsNotNull(model.Member);
                Assert.IsNotNull(model.PetFoodDropDownList);
                Assert.IsNotNull(model.RouteDropDownList);
                Assert.IsNotNull(model.DelayedBillingDropDownList);
            }
        }

        [TestMethod]
        public void Edit_Get_2()
        {
        }
    }
}
