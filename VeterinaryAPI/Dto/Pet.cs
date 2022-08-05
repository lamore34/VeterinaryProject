using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace VeterinaryAPI.Dto
{
	public class Pet
	{
		public int id { get; set; }
		public string name { get; set; }
		public int age { get; set; }
		public string weight { get; set; }
		public bool vaccines { get; set; }
		public string gender { get; set; }
		public bool microChip { get; set; }
		public string codeMicroChip { get; set; }
		public string observations { get; set; }
		public DateTime registrationDate { get; set; }
		public Breed breed { get; set; }
		public TypePet typePet { get; set; }
	}
}
