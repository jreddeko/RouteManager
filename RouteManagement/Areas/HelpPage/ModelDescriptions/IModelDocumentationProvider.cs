using System;
using System.Reflection;

namespace RouteManagement.Areas.HelpPage.ModelDescriptions
{
    public interface IModelDocumentationProvider
    {
        string GetDocumentation(MemberInfo customer);

        string GetDocumentation(Type type);
    }
}