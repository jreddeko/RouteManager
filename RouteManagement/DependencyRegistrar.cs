using Autofac;
using Autofac.Core;
using Autofac.Integration.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using Wddc.Core.Configuration;
using Wddc.Core.Data;
using Wddc.Core.Fakes;
using Wddc.Core.Infrastructure;
using Wddc.Core.Infrastructure.DependencyManagement;
using Wddc.Data;
using Wddc.Data.AscTrac;
using Wddc.Data.EdiOrdering;
using Wddc.Data.GreatPlains;
using Wddc.Services.AscTrac;
using Wddc.Services.Authentication;
using Wddc.Services.EdiOrdering;
using Wddc.Services.GreatPlains;

namespace RouteManagement
{
    /// <summary>
    /// Uses Autofac to build dependecies https://autofac.org/
    /// </summary>
    public class DependencyRegistrar : IDependencyRegistrar
    {
        public int Order
        {
            get
            {
                return 0;
            }
        }

        public void Register(ContainerBuilder builder, ITypeFinder typeFinder, WddcConfig config)
        {
            //HTTP context and other related stuff
            builder.Register(c =>
                //register FakeHttpContext when HttpContext is not available
                HttpContext.Current != null ?
                (new HttpContextWrapper(HttpContext.Current) as HttpContextBase) :
                (new FakeHttpContext("~/") as HttpContextBase))
                .As<HttpContextBase>()
                .InstancePerLifetimeScope();
            builder.Register(c => c.Resolve<HttpContextBase>().Request)
                .As<HttpRequestBase>()
                .InstancePerLifetimeScope();
            builder.Register(c => c.Resolve<HttpContextBase>().Response)
                .As<HttpResponseBase>()
                .InstancePerLifetimeScope();
            builder.Register(c => c.Resolve<HttpContextBase>().Server)
                .As<HttpServerUtilityBase>()
                .InstancePerLifetimeScope();
            builder.Register(c => c.Resolve<HttpContextBase>().Session)
                .As<HttpSessionStateBase>()
                .InstancePerLifetimeScope();
            

            //register all controllers
            builder.RegisterControllers(typeFinder.GetAssemblies().ToArray());

            // register EF object contexts
            builder.Register<EdiObjectContext>(c => new EdiObjectContext()).InstancePerLifetimeScope();
            builder.Register<AscObjectContext>(c => new AscObjectContext()).InstancePerLifetimeScope();
            builder.Register<GpObjectContext>(c => new GpObjectContext()).InstancePerLifetimeScope();

            // register generic repositories
            builder.RegisterGeneric(typeof(EfRepository<>)).As(typeof(IRepository<>)).InstancePerLifetimeScope();
            builder.RegisterGeneric(typeof(EdiRepository<>)).As(typeof(IEdiRepository<>)).InstancePerLifetimeScope();
            builder.RegisterGeneric(typeof(AscRepository<>)).As(typeof(IAscRepository<>)).InstancePerLifetimeScope();
            builder.RegisterGeneric(typeof(GpRepository<>)).As(typeof(IGpRepository<>)).InstancePerLifetimeScope();

            // register services
            builder.RegisterType<ActiveDirectoryService>().As<IActiveDirectoryService>().InstancePerLifetimeScope();
            builder.RegisterType<RouteService>().As<IRouteService>().InstancePerLifetimeScope();
            builder.RegisterType<RouteExceptionService>().As<IRouteExceptionService>().InstancePerLifetimeScope();
            builder.RegisterType<CustomerSettingService>().As<ICustomerSettingService>().InstancePerLifetimeScope();
            builder.RegisterType<CustomerSetupStateService>().As<ICustomerSetupStateService>().InstancePerLifetimeScope();
            builder.RegisterType<CarrierAccountService>().As<ICarrierAccountService>().InstancePerLifetimeScope();
            builder.RegisterType<CustomerService>().As<ICustomerService>().InstancePerLifetimeScope();

            // providers
            builder.RegisterType<ActiveDirectoryRoleProvider>()
                .WithParameter(ResolvedParameter.ForNamed<IActiveDirectoryService>("_activeDirectoryService"))
                .InstancePerLifetimeScope();
        }
    }
}