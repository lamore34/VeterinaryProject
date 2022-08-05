import { HttpClientModule } from '@angular/common/http';
import { NgModule } from '@angular/core';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { PetsHomeComponent } from './pets-home/pets-home.component';
import { EnvServiceProvider } from './services/env.service.provider';
import { NewPetsComponent } from './new-pets/new-pets.component';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';

@NgModule({
  declarations: [
    AppComponent,
    PetsHomeComponent,
    NewPetsComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    ReactiveFormsModule,
    FormsModule,
    NgbModule
  ],
  providers: [EnvServiceProvider,HttpClientModule],
  bootstrap: [AppComponent]
})
export class AppModule { }
