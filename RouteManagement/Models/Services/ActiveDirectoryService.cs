using System;
using System.Collections.Generic;
using System.DirectoryServices.AccountManagement;
using System.Linq;
using System.Web;

namespace RouteManagement.Models.Services
{
    public class ActiveDirectoryService
    {
        private string _domain;

        public ActiveDirectoryService(string domain)
        {
            this._domain = domain;
        }

        public bool ValidateCredentials(string username, string password)
        {
            using (var context = new PrincipalContext(ContextType.Domain, _domain))
            {
                var user = this.GetUserByEmail(username);
                return context.ValidateCredentials(user.UserName, password);
            }
        }

        public ApplicationUser GetUser(string username)
        {
            using (var context = new PrincipalContext(ContextType.Domain, _domain))
            {
                var user = UserPrincipal.FindByIdentity(context, username);
                if (user != null)
                {
                    return _getApplicationUser(user);
                }
            }
            return null;
        }

        public ApplicationUser GetUserByEmail(string email)
        {
            using (var context = new PrincipalContext(ContextType.Domain, _domain))
            {
                // define a "query-by-example" principal - 
                UserPrincipal queryUser = new UserPrincipal(context);
                queryUser.EmailAddress = email;

                // create your principal searcher passing in the QBE principal    
                PrincipalSearcher srch = new PrincipalSearcher(queryUser);

                var result = srch.FindOne();
                var user = UserPrincipal.FindByIdentity(context, result.SamAccountName);
                if (user != null)
                {
                    return _getApplicationUser(user);
                }
                return null;
            }
        }

        public IList<string> GetRoles(string userId)
        {
            using (var context = new PrincipalContext(ContextType.Domain, _domain))
            {
                var user = UserPrincipal.FindByIdentity(context, userId);
                return user.GetAuthorizationGroups()
                    .Select(x => x.Name)
                    .ToList();
            }
        }

        private ApplicationUser _getApplicationUser(UserPrincipal user)
        {
            return new ApplicationUser()
            {
                UserName = user.SamAccountName,
                Email = user.EmailAddress,
                PhoneNumber = user.VoiceTelephoneNumber,
                EmailConfirmed = true,
                Id = user.SamAccountName,
                Name = user.DisplayName,
            };
        }
    }
}