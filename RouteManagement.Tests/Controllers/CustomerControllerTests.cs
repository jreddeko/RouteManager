using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using RouteManagement.Controllers;
using System.Web.Mvc;
using System.Linq;
using RouteManagement.Exceptions;
using Wddc.Extensions;
using RouteManagement.ViewModels;
using RouteManagement.ViewModels.CustomerViewModels;
using Wddc.Services.EdiOrdering;
using Wddc.Data.EdiOrdering;
using Wddc.Core.Entities.EdiOrdering.Customers;
using Wddc.Data.GreatPlains;
using Rhino.Mocks;
using Wddc.Data.AscTrac;
using Wddc.Services.AscTrac;
using Wddc.Services.GreatPlains;
using Wddc.Core.Entities.EdiOrdering.Routes;

namespace RouteManagement.Tests.Controllers
{
    [TestClass]
    public class CustomerControllerTests : RouteManagementTest
    {
        private CustomerController controller;
        private ICustomerSetupStateService _customerSetupStateService;

        [TestInitialize]
        public void Setup()
        {
            base.Init();
            this.controller = new CustomerController(_routeService, _customerSettingService, _customerSetupStateService);
            
            var gpCustomerRepository = MockRepository.GenerateMock<IGpRepository<RM00101>>();
            gpCustomerRepository
                .Expect(x => x.Table)
                .Return((new GpObjectContext()).RM00101);
            var carrierAccountRepository = MockRepository.GenerateMock<IAscRepository<CARRIERACCT>>();
            carrierAccountRepository
                .Expect(x => x.Table)
                .Return((new AscObjectContext()).CARRIERACCTs);
            var customerSettingRepository = MockRepository.GenerateMock<IEdiRepository<CustomerSetting>>();
            customerSettingRepository
                .Expect(x => x.Table)
                .Return((new EdiObjectContext()).CustomerSettings);
            var carrierAccountService = new CarrierAccountService(carrierAccountRepository);
            var customerService = new CustomerService(gpCustomerRepository);
            var customerSettingOptionRepository = MockRepository.GenerateMock<IEdiRepository<CustomerSettingOption>>();
            customerSettingOptionRepository
                .Expect(x => x.Table)
                .Return((new EdiObjectContext()).CustomerSettingOptions);
            var customerSettingService = new CustomerSettingService(customerSettingRepository,
                customerSettingOptionRepository);

            _customerSetupStateService = new CustomerSetupStateService(
                carrierAccountService, customerService, customerSettingService);
        }
        [TestMethod]
        public void Index_CheckAllComplete()
        {
            //var dropdownlist = new DropDownListViewModel()
            //{
            //    SelectedValue = "Complete",
            //};
            //var result = controller.Index(null, null, dropdownlist) as ViewResult;
            //Assert.IsNotNull(result, "Result null check");
            //var model = result.Model as IndexViewModel;
            //Assert.IsNotNull(model, "Cast to model null check");
            //Assert.IsTrue(model.Customers.All(m => m.SetupState == SetupState.Complete));
            //for (int i =1; i< 3; i++)
            //{
            //    result = controller.Index(null, i, dropdownlist) as ViewResult;
            //    Assert.IsNotNull(result, "Result null check");
            //    model = result.Model as IndexViewModel;
            //    Assert.IsNotNull(model, "Cast to model null check");
            //    Assert.IsTrue(model.Customers.All(m => m.SetupState == SetupState.Complete));
            //}
        }

        [TestMethod]
        public void Index_CheckAllPendingShippingSetup()
        {
            //var dropdownlist = new DropDownListViewModel()
            //{
            //    SelectedValue = "PendingShippingSetup",
            //};
            //var result = controller.Index(null, null, dropdownlist) as ViewResult;
            //Assert.IsNotNull(result, "Result null check");
            //var model = result.Model as IndexViewModel;
            //Assert.IsNotNull(model, "Cast to model null check");
            //Assert.IsTrue(model.Customers.All(m => m.SetupState == SetupState.PendingShippingSetup));
            //result = controller.Index(null, 2, dropdownlist) as ViewResult;
            //Assert.IsNotNull(result, "Result null check");
            //model = result.Model as IndexViewModel;
            //Assert.IsNotNull(model, "Cast to model null check");
            //Assert.IsTrue(model.Customers.All(m => m.SetupState == SetupState.PendingShippingSetup));
        }

        [TestMethod]
        public void Index_2()
        {
            //var result = controller.Index("impact", null, null) as ViewResult;
            //Assert.IsNotNull(result, "Result null check");
            //var model = result.Model as IndexViewModel;
            //Assert.IsNotNull(model, "Cast to model null check");
            //Assert.IsTrue(model.Customers.All(m => m.Information.CustomerName.Contains("impact", StringComparison.InvariantCultureIgnoreCase)));
        }

        /// <summary>
        /// Try to add a customer thats already been added.
        /// </summary>
        [TestMethod]
        [ExpectedException(typeof(AggregateException))]
        public void Add_SetupState_Complete_1()
        {
            var customers = _customerSetupStateService
                .GetAll(15);
            var customer = customers.First();
            var result = controller.Add(customer.Id) as ViewResult;
            Assert.IsNotNull(result, "Result null check");
            var model = result.Model as AddViewModel;
            Assert.IsNotNull(model, "Cast to model null check");
            Assert.IsTrue(model.CustomerId == customer.Id);
            Assert.IsTrue(model.PetFoodDropDownList != null);
            Assert.IsTrue(model.RouteDropDownList != null);
            Assert.IsTrue(model.DelayedBillingDropDownList != null);
        }
        /// <summary>
        /// Try to add a customer thats already been added.
        /// </summary>
        [TestMethod]
        [ExpectedException(typeof(AggregateException))]
        public void Add_SetupState_PendingShipping_1()
        {
            var customers = _customerSetupStateService
                .GetAll(10);
            var customer = customers.First();
            var result = controller.Add(customer.Id) as ViewResult;
            Assert.IsNotNull(result, "Result null check");
            var model = result.Model as AddViewModel;
            Assert.IsNotNull(model, "Cast to model null check");
            Assert.IsTrue(model.CustomerId == customer.Id);
            Assert.IsTrue(model.PetFoodDropDownList != null);
            Assert.IsTrue(model.RouteDropDownList != null);
            Assert.IsTrue(model.DelayedBillingDropDownList != null);
        }

        [TestMethod]
        public void Add_Get_1()
        {
            var customers = _customerSetupStateService
                .GetAll(5);
            foreach (var customer in customers.Take(50))
            {
                var result = controller.Add(customer.Id) as ViewResult;
                Assert.IsNotNull(result, "Result null check");
                var model = result.Model as AddViewModel;
                Assert.IsNotNull(model, "Cast to model null check");
                Assert.IsTrue(model.CustomerId == customer.Id);
                Assert.IsNotNull(model.CustomerName == customer.Information.CustomerName);
                Assert.IsNotNull(model.PetFoodDropDownList);
                Assert.IsNotNull(model.RouteDropDownList);
                Assert.IsNotNull(model.DelayedBillingDropDownList);
            }
        }

        [TestMethod]
        public void Edit_Get_1()
        {
            var customers = _customerSetupStateService
                .GetAll(15);
            foreach (var customer in customers.Take(50))
            {
                var result = controller.Edit(customer.Id) as ViewResult;
                Assert.IsNotNull(result, "Result null check");
                var model = result.Model as EditViewModel;
                Assert.IsNotNull(model, "Cast to model null check");
                Assert.IsTrue(model.CustomerId == customer.Id);
                Assert.IsNotNull(model.Customer);
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
