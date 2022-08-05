import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { EnvService } from './env.service';
import { IPets } from '../models/IPets';

@Injectable({
  providedIn: 'root'
})
export class PetsService {
  private headers: HttpHeaders;
  constructor(private http: HttpClient, private env: EnvService) {
    this.headers = new HttpHeaders({ 'Content-Type': 'application/json; charset=utf-8' });
  }

  public GetPetsList() {    
    return this.http.get('http://localhost:8972/api/Veterinary/GetPets', { headers: this.headers })
  }
  public GetBreedList() {    
    return this.http.get('http://localhost:8972/api/Veterinary/GetBreeds', { headers: this.headers })
  }
  public GetTypePetsList() {    
    return this.http.get('http://localhost:8972/api/Veterinary/GetTypePet', { headers: this.headers })
  }
  public SavePet(PetObject: IPets) {  
    debugger;  
    return this.http.post('http://localhost:8972/api/Veterinary/SavePet', PetObject, { headers: this.headers })
  }
  public DeletePet(id: String) {    
    return this.http.delete('http://localhost:8972/api/Veterinary/?id=' + id, { headers: this.headers })
  }
}
