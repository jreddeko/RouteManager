﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RouteManagement.Exceptions
{
    public class MemberRouteException : Exception
    {
        public MemberRouteException(string message) : base(message)
        {
        }
    }
}