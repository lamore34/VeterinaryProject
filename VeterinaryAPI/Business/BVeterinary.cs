using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using VeterinaryAPI.Dto;

namespace VeterinaryAPI.Business
{
	public class BVeterinary
	{
		string conn = @"Data Source=DESKTOP-43DQ9V9\SQLEXPRESS; Initial Catalog=VETERINARY; Integrated Security=True;";

		public Response Save(Pet objPet)
		{
			try
			{
				using (SqlConnection con = new SqlConnection(conn))
				{
					using (SqlCommand cmd = new SqlCommand("SP_INSERT_PETS", con))
					{
						cmd.CommandType = CommandType.StoredProcedure;

						cmd.Parameters.Add("@Pet_Name", SqlDbType.VarChar).Value = objPet.name;
						cmd.Parameters.Add("@Pet_Gender", SqlDbType.VarChar).Value = objPet.gender;
						cmd.Parameters.Add("@Pet_Age", SqlDbType.Int).Value = objPet.age;
						cmd.Parameters.Add("@Pet_Weight", SqlDbType.VarChar).Value = objPet.weight;
						cmd.Parameters.Add("@Pet_Vaccines", SqlDbType.Bit).Value = objPet.vaccines;
						cmd.Parameters.Add("@Pet_Microchip", SqlDbType.Bit).Value = objPet.microChip;
						cmd.Parameters.Add("@Pet_CodeMicrochip", SqlDbType.VarChar).Value = objPet.codeMicroChip;
						cmd.Parameters.Add("@Pet_Observations", SqlDbType.VarChar).Value = objPet.observations;
						cmd.Parameters.Add("@Breed_Id", SqlDbType.Int).Value = objPet.breed.id;
						cmd.Parameters.Add("@TypePet_Id", SqlDbType.Int).Value = objPet.typePet.id;

						con.Open();
						cmd.ExecuteNonQuery();
						con.Close();
					}
				}

				return new Response
				{
					code = "00",
					message = "",
					custom = null
				};
			}
			catch (Exception ex)
			{
				return new Response
				{
					code = "99",
					message = ex.ToString(),
					custom = null
				};
			}
		}

		public Response UpdatePet(Pet objPet)
		{
			try
			{
				using (SqlConnection con = new SqlConnection(conn))
				{
					using (SqlCommand cmd = new SqlCommand("SP_UPDATE_PETS", con))
					{
						cmd.CommandType = CommandType.StoredProcedure;

						cmd.Parameters.Add("@Pet_Id", SqlDbType.Int).Value = objPet.id;
						cmd.Parameters.Add("@Pet_Name", SqlDbType.VarChar).Value = objPet.name;
						cmd.Parameters.Add("@Pet_Gender", SqlDbType.VarChar).Value = objPet.gender;
						cmd.Parameters.Add("@Pet_Age", SqlDbType.Int).Value = objPet.age;
						cmd.Parameters.Add("@Pet_Weight", SqlDbType.VarChar).Value = objPet.weight;
						cmd.Parameters.Add("@Pet_Vaccines", SqlDbType.Bit).Value = objPet.vaccines;
						cmd.Parameters.Add("@Pet_Microchip", SqlDbType.Bit).Value = objPet.microChip;
						cmd.Parameters.Add("@Pet_CodeMicrochip", SqlDbType.VarChar).Value = objPet.codeMicroChip;
						cmd.Parameters.Add("@Pet_Observations", SqlDbType.VarChar).Value = objPet.observations;
						cmd.Parameters.Add("@Breed_Id", SqlDbType.Int).Value = objPet.breed.id;
						cmd.Parameters.Add("@TypePet_Id", SqlDbType.Int).Value = objPet.typePet.id;

						con.Open();
						cmd.ExecuteNonQuery();
						con.Close();
					}
				}

				return new Response
				{
					code = "00",
					message = "",
					custom = null
				};
			}
			catch (Exception ex)
			{
				return new Response
				{
					code = "99",
					message = ex.ToString(),
					custom = null
				};
			}
		}
		public Response GetPets()
		{
			List<Pet> listPets = new List<Pet>();
			try
			{
				using (SqlConnection con = new SqlConnection(conn))
				{
					using (SqlCommand cmd = new SqlCommand("SP_GET_PETS", con))
					{
						cmd.CommandType = CommandType.StoredProcedure;

						con.Open();
						SqlDataReader reader = cmd.ExecuteReader();
						
						if (reader.HasRows)
						{
							while (reader.Read())
							{
								listPets.Add(new Pet
								{
									id = Convert.ToInt32(reader["Pet_Id"]),
									name = reader["Pet_Name"].ToString(),
									age = int.Parse(reader["Pet_Age"].ToString()),
									breed = new Breed { description = reader["Breed_Description"].ToString() },
									codeMicroChip = reader["Pet_CodeMicroChip"].ToString(),
									gender = reader["Pet_Gender"].ToString(),
									microChip = (reader["Pet_MicroChip"].ToString() == "1") ? true : false,
									observations = reader["Pet_Observations"].ToString(),
									registrationDate = Convert.ToDateTime(reader["Pet_RegistrationDate"].ToString()),
									typePet = new TypePet { description = reader["TypePet_Description"].ToString() },
									vaccines = (reader["Pet_Vaccines"].ToString() == "1") ? true : false,
									weight = reader["Pet_Weight"].ToString()
								});
							}
						}
						con.Close();
					}
				}

				return new Response
				{
					code = "00",
					message = "",
					custom = listPets
				};
			}
			catch (Exception ex)
			{
				return new Response
				{
					code = "99",
					message = ex.ToString(),
					custom = null
				};
			}
		}

		public Response GetTypePet()
		{
			List<TypePet> listTypes = new List<TypePet>();
			try
			{
				using (SqlConnection con = new SqlConnection(conn))
				{
					using (SqlCommand cmd = new SqlCommand("SP_GET_TYPEPET", con))
					{
						cmd.CommandType = CommandType.StoredProcedure;

						con.Open();
						SqlDataReader reader = cmd.ExecuteReader();
						
						if (reader.HasRows)
						{
							while (reader.Read())
							{
								listTypes.Add(new TypePet
								{
									id = Convert.ToInt32(reader["TypePet_Id"]),
									description = reader["TypePet_Description"].ToString()
								});
							}
						}
						con.Close();
					}
				}

				return new Response
				{
					code = "00",
					message = "",
					custom = listTypes
				};
			}
			catch (Exception ex)
			{
				return new Response
				{
					code = "99",
					message = ex.ToString(),
					custom = null
				};
			}
		}

		public Response GetBreeds()
		{
			List<Breed> listBreed = new List<Breed>();

			try
			{
				using (SqlConnection con = new SqlConnection(conn))
				{
					using (SqlCommand cmd = new SqlCommand("SP_GET_BREED", con))
					{
						cmd.CommandType = CommandType.StoredProcedure;

						con.Open();
						SqlDataReader reader = cmd.ExecuteReader();
						
						if (reader.HasRows)
						{
							while (reader.Read())
							{
								listBreed.Add(new Breed
								{
									id = Convert.ToInt32(reader["Breed_ID"]),
									description = reader["Breed_Description"].ToString()
								});
							}
						}
						con.Close();
					}
				}

				return new Response
				{
					code = "00",
					message = "",
					custom = listBreed
				};
			}
			catch (Exception ex)
			{
				return new Response
				{
					code = "99",
					message = ex.ToString(),
					custom = null
				};
			}
		}
		public Response DeletePet(int idPet)
		{
			try
			{
				using (SqlConnection con = new SqlConnection(conn))
				{
					using (SqlCommand cmd = new SqlCommand("SP_DELETE_PETS", con))
					{
						cmd.CommandType = CommandType.StoredProcedure;

						cmd.Parameters.Add("@Pet_Id", SqlDbType.Int).Value = idPet;

						con.Open();
						cmd.ExecuteNonQuery();
						con.Close();
					}
				}

				return new Response
				{
					code = "00",
					message = "",
					custom = null
				};
			}
			catch (Exception ex)
			{
				return new Response
				{
					code = "99",
					message = ex.ToString(),
					custom = null
				};
			}
		}

	}
}
