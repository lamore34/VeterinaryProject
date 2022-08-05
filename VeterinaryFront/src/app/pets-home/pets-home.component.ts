import { Component, OnInit, ChangeDetectorRef } from '@angular/core';
import { IPets } from '../models/IPets';
import { EnvService } from '../services/env.service';
import { PetsService } from '../services/pets.service';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';

declare var $;

@Component({
  selector: 'app-pets-home',
  templateUrl: './pets-home.component.html',
  styleUrls: ['./pets-home.component.css']
})
export class PetsHomeComponent implements OnInit {

  petsList: IPets[] = [];
  messageError: any;
  dataTable: any;

  constructor(
    private env: EnvService,
    private PetsService: PetsService,
    private chRef: ChangeDetectorRef,
    private modalService: NgbModal) { }

  ngOnInit(): void {
    this.getPets();    
  }

  public getPets(){    
    this.PetsService.GetPetsList().subscribe((resp: any) => {
      console.log("Get Pets", resp);
      this.petsList = [];

      if(resp.code == "00"){
        if(resp.custom != null){
          if (resp.custom.length > 0) {
            this.petsList = resp.custom;

          }
          else{
            this.messageError = "No records found";            
          }
        }
      }
      else{
        this.messageError = "Error getting Pets: " + resp.message;
      }

      //this.dataTable.clear().destroy();      
      this.chRef.detectChanges();
      this.dataTable = $('#dataTable').DataTable();
    }, error => {
      console.log("Error getting pets", error);
      this.messageError = "Error getting pets";      
    }, () => {
      
    });
  }

  public EditRecord() {
    alert('OOOPS !! UNDER CONSTRUCTION')
  }

  public DeleteRecord(id: string) {
    this.PetsService.DeletePet(id).subscribe((resp: any) => {
      console.log("Delete Pets: ", resp.custom);      
      
      if(resp.code == "00"){
        this.getPets();
      }
      else{
        this.messageError = "Error deleting Pets: " + resp.message;
      }

      this.modalService.dismissAll();
    },
      error => {
        console.log("Error", error);
        this.messageError = error;
      }
    );
  }
  
  public NewRecord(modal){
    this.modalService.open(modal, { size: 'l' });
    this.getPets();
  }
}
