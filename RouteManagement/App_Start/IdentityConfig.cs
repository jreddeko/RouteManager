using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin;
using Microsoft.Owin.Security;
using RouteManagement.Models;
using RouteManagement.Models.Services;

namespace RouteManagement
{
    public class EmailService : IIdentityMessageService
    {
        public Task SendAsync(IdentityMessage message)
        {
            // Plug in your email service here to send an email.
            return Task.FromResult(0);
        }
    }

    public class SmsService : IIdentityMessageService
    {
        public Task SendAsync(IdentityMessage message)
        {
            // Plug in your SMS service here to send a text message.
            return Task.FromResult(0);
        }
    }

    // Configure the application user manager which is used in this application.
    public class ApplicationUserManager : UserManager<ApplicationUser>
    {
        ActiveDirectoryService _activeDirectoryService = new ActiveDirectoryService("WDDCHO");
        public ApplicationUserManager(IUserStore<ApplicationUser> store)
            : base(store)
        {
        }
        public static ApplicationUserManager Create(IdentityFactoryOptions<ApplicationUserManager> options,
            IOwinContext context)
        {
            var manager = new ApplicationUserManager(new UserStore<ApplicationUser>(context.Get<ApplicationDbContext>()));
            // Configure validation logic for usernames
            manager.UserValidator = new UserValidator<ApplicationUser>(manager)
            {
                AllowOnlyAlphanumericUserNames = false,
                RequireUniqueEmail = true
            };

            // Configure validation logic for passwords
            manager.PasswordValidator = new PasswordValidator
            {
                RequiredLength = 6,
                RequireNonLetterOrDigit = true,
                RequireDigit = true,
                RequireLowercase = true,
                RequireUppercase = true,
            };

            // Configure user lockout defaults
            manager.UserLockoutEnabledByDefault = true;
            manager.DefaultAccountLockoutTimeSpan = TimeSpan.FromMinutes(5);
            manager.MaxFailedAccessAttemptsBeforeLockout = 5;

            // Register two factor authentication providers. This application uses Phone and Emails as a step of receiving a code for verifying the user
            // You can write your own provider and plug it in here.
            manager.RegisterTwoFactorProvider("Phone Code", new PhoneNumberTokenProvider<ApplicationUser>
            {
                MessageFormat = "Your security code is {0}"
            });
            manager.RegisterTwoFactorProvider("Email Code", new EmailTokenProvider<ApplicationUser>
            {
                Subject = "Security Code",
                BodyFormat = "Your security code is {0}"
            });
            manager.EmailService = new EmailService();
            manager.SmsService = new SmsService();
            var dataProtectionProvider = options.DataProtectionProvider;
            if (dataProtectionProvider != null)
            {
                manager.UserTokenProvider =
                    new DataProtectorTokenProvider<ApplicationUser>(dataProtectionProvider.Create("ASP.NET Identity"));
            }
            return manager;
        }
        public override Task<ApplicationUser> FindAsync(string userName, string password)
        {
            if (_activeDirectoryService.ValidateCredentials(userName, password))
                return Task.Run(() => _activeDirectoryService.GetUser(userName));
            else
                return null;
        }

        public override Task<ApplicationUser> FindAsync(UserLoginInfo login)
        {
            throw new NotImplementedException();
        }

        public override Task<ApplicationUser> FindByEmailAsync(string email)
        {
            return Task.Run(() => _activeDirectoryService.GetUserByEmail(email));
        }

        public override Task<ApplicationUser> FindByIdAsync(string userId)
        {
            return Task.Run(() => _activeDirectoryService.GetUser(userId));
        }

        public override Task<ApplicationUser> FindByNameAsync(string userName)
        {
            return Task.Run(() => _activeDirectoryService.GetUser(userName));
        }

        public override Task<IdentityResult> ChangePhoneNumberAsync(string userId, string phoneNumber, string token)
        {
            throw new NotImplementedException();
        }
        public override Task<string> GetPhoneNumberAsync(string userId)
        {
            return Task.Run(() => _activeDirectoryService.GetUser(userId).PhoneNumber);
        }

        public override Task<IdentityResult> SetPhoneNumberAsync(string userId, string phoneNumber)
        {
            throw new NotImplementedException();
        }

        public override Task<string> GenerateChangePhoneNumberTokenAsync(string userId, string phoneNumber)
        {
            throw new NotImplementedException();
        }

        public override Task<bool> IsPhoneNumberConfirmedAsync(string userId)
        {
            throw new NotImplementedException();
        }

        public override Task<IList<string>> GetRolesAsync(string userId)
        {
            return Task.Run(() => _activeDirectoryService.GetRoles(userId));
        }

        public override Task<ClaimsIdentity> CreateIdentityAsync(ApplicationUser user, string authenticationType)
        {
            IList<Claim> claims = new List<Claim>
            {
                new Claim(ClaimTypes.NameIdentifier, user.UserName),
                new Claim(ClaimTypes.Email, user.Email),
                new Claim(ClaimTypes.Name, user.UserName),
            };

            return Task.Run(() => new ClaimsIdentity(claims, authenticationType));
        }
    }

    // Configure the application sign-in manager which is used in this application.  
    public class ApplicationSignInManager : SignInManager<ApplicationUser, string>
    {
        ActiveDirectoryService _activeDirectoryService = new ActiveDirectoryService("WDDCHO");
        public ApplicationSignInManager(ApplicationUserManager userManager, IAuthenticationManager authenticationManager) :
            base(userManager, authenticationManager)
        { }

        public override Task<ClaimsIdentity> CreateUserIdentityAsync(ApplicationUser user)
        {
            return user.GenerateUserIdentityAsync((ApplicationUserManager)UserManager);
        }

        public static ApplicationSignInManager Create(IdentityFactoryOptions<ApplicationSignInManager> options, IOwinContext context)
        {
            return new ApplicationSignInManager(context.GetUserManager<ApplicationUserManager>(), context.Authentication);
        }

        public override Task<SignInStatus> PasswordSignInAsync(string userName, string password, bool isPersistent, bool shouldLockout)
        {
            return Task.Run(() => validateCredentials("WDDCHO", userName, password));
        }

        private SignInStatus validateCredentials(string v, string userName, string password)
        {
            var authorized = _activeDirectoryService.ValidateCredentials(userName, password);
            if (!authorized)
                return SignInStatus.Failure;

            var user = _activeDirectoryService.GetUserByEmail(userName);

            IList<Claim> claims = new List<Claim>
            {
                new Claim(ClaimTypes.NameIdentifier, user.UserName),
                new Claim(ClaimTypes.Email, user.Email),
                new Claim(ClaimTypes.Name, user.UserName),
            };

            ClaimsIdentity identity = new ClaimsIdentity(claims, AuthenticationType);

            this.AuthenticationManager.SignIn(identity);
            return SignInStatus.Success;

        }
    }
}
