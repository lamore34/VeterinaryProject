import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { IPets, IBreed, ITypePet } from '../models/IPets';
import { PetsService } from '../services/pets.service';
@Component({
  selector: 'app-new-pets',
  templateUrl: './new-pets.component.html',
  styleUrls: ['./new-pets.component.css']
})
export class NewPetsComponent implements OnInit {

  dropBreed: any = [];
  dropTypePet: any = [];
  messageError: any;
  petObject: IPets;
  breedObject: IBreed;
  typePetObject: ITypePet;
  hasMicroChip: boolean = true;

  public formNew = new FormGroup({
    Name: new FormControl(""),
    Gender: new FormControl(""),
    Age: new FormControl(""),
    Weight: new FormControl(""),
    Vaccines: new FormControl(false),
    Microchip: new FormControl(false),
    CodeMicroChip: new FormControl(""),
    Observations: new FormControl(""),
    Breed: new FormControl("0"),
    TypePet: new FormControl("0")
  });

  constructor(
    private modalService: NgbModal,
    private PetsService: PetsService
  ) { }

  ngOnInit(): void {
    this.GetBreedList();
    this.GetTypePetList();
  }

  public CloseModal() {
    this.modalService.dismissAll();
  }

  public SaveRecord() {

    var isValid = false;
    if (this.formNew.get("Name").value != ''
      && this.formNew.get("Gender").value
      && this.formNew.get("Age").value != ''
      && String(this.formNew.get("Weight").value) != ''
      && this.formNew.get("CodeMicroChip").value != ''
      && this.formNew.get("Observations").value != ''
    ) {
      isValid = true;
    }

    if (isValid) {

      this.breedObject = {
        id: Number(this.formNew.get("Breed").value),
        description: null
      }

      this.typePetObject = {
        id: Number(this.formNew.get("TypePet").value),
        description: null
      }

      this.petObject = {
        name: this.formNew.get("Name").value,
        gender: this.formNew.get("Gender").value,
        age: this.formNew.get("Age").value,
        weight: String(this.formNew.get("Weight").value),
        vaccines: Boolean(this.formNew.get("Vaccines").value),
        microChip: Boolean(this.formNew.get("Microchip").value),
        codeMicroChip: this.formNew.get("CodeMicroChip").value,
        observations: this.formNew.get("Observations").value,
        breed: this.breedObject,
        typePet: this.typePetObject,
        id: 0
      }

      this.PetsService.SavePet(this.petObject).subscribe((resp: any) => {
        console.log("Save Pets: ", resp.custom);

        if (resp.code == "00") {

        }
        else {
          this.messageError = "Error saving Pets: " + resp.message;
        }

        this.modalService.dismissAll();
      },
        error => {
          console.log("Error", error);
          this.messageError = error;
        }
      );
    }
    else{
      alert("ALL FIELDS REQUIRED")
    }
  }
  public GetBreedList() {
    this.PetsService.GetBreedList().subscribe((resp: any) => {
      this.dropBreed = [];
      if (resp.custom != null) {
        this.dropBreed = resp.custom;
      }
    },
      error => {
        console.log("Error Getting Breeds", error);
      }
      , () => {
      }
    );
  }
  public GetTypePetList() {
    this.PetsService.GetTypePetsList().subscribe((resp: any) => {
      this.dropTypePet = [];
      if (resp.custom != null) {
        this.dropTypePet = resp.custom;
      }
    },
      error => {
        console.log("Error Getting TypePet", error);
      }
      , () => {
      }
    );
  }
  public onChangeGender(e) {
    this.formNew.get('Gender').setValue(e.target.value);
  }
  public onChangeVaccines(e) {
    this.formNew.get('Vaccines').setValue(e.target.value);
  }
  public onChangeMicrochip(e) {
    debugger;
    this.formNew.get('Microchip').setValue(e.target.value);
    this.hasMicroChip = (e.target.value == "true") ? true : false;
  }
}
