import { ComponentFixture, TestBed } from '@angular/core/testing';

import { NewPetsComponent } from './new-pets.component';

describe('NewPetsComponent', () => {
  let component: NewPetsComponent;
  let fixture: ComponentFixture<NewPetsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ NewPetsComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(NewPetsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
