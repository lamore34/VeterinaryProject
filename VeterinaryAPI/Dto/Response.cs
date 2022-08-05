using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace VeterinaryAPI.Dto
{
	public class Response
	{
		public string code { get; set; }
		public string message { get; set; }
		public dynamic custom { get; set; }
	}
}
