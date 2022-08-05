using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using VeterinaryAPI.Business;
using VeterinaryAPI.Dto;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace VeterinaryAPI.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class VeterinaryController : ControllerBase
	{
		BVeterinary bVet = new BVeterinary();
		
		// GET api/<VeterinaryController>/
		[HttpGet("GetTypePet")]
		public Response GetTypePet()
		{
			return bVet.GetTypePet();
		}

		// GET api/<VeterinaryController>/
		[HttpGet("GetBreeds")]
		public Response GetBreeds()
		{
			return bVet.GetBreeds();
		}

		// GET api/<VeterinaryController>/
		[HttpGet("GetPets")]
		public Response GetPets()
		{
			return bVet.GetPets();
		}

		// POST api/<VeterinaryController>
		[HttpPost("SavePet")]
		public Response SavePet(Pet objPet)
		{
			return bVet.Save(objPet);
		}				

		// DELETE api/<VeterinaryController>/5
		[HttpDelete]
		public Response DeletePet(int id)
		{
			return bVet.DeletePet(id);
		}

		[HttpPost("UpdatePet")]
		public Response UpdatePet(Pet objPet)
		{
			return bVet.UpdatePet(objPet);
		}
	}
}
