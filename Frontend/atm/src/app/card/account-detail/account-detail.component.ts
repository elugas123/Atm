import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { CardService } from '../card.service';

@Component({
  selector: 'app-account-detail',
  templateUrl: './account-detail.component.html',
  styleUrls: ['./account-detail.component.css']
})
export class AccountDetailComponent implements OnInit {
  account_detail = {
    "saldo": 0
  }
  constructor(private router: Router, private cardService: CardService) { }

  ngOnInit(): void {
    this.cardService.getAccountDetail(localStorage.getItem("id")).subscribe(
      (response) => {     
        console.log(response) 
        this.account_detail = response;

        this.cardService.saveOperation({
          "tipoOperacionId": 1,
          "cantidad": this.account_detail.saldo
        }).subscribe(
          (response) => {    
            console.log(response)  
            // this.router.navigate(['/card/home']);
          },
          (error) => {       
            // this.router.navigate(['/error']);
            localStorage.setItem("mensaje", "Imposible grabar operacion");
          }
        )
      },
      (error) => {       
        // this.router.navigate(['/error']);
        localStorage.setItem("mensaje", "No se pudo obtener el saldo");
      }
    );
    
   
   }

  back() {
    this.router.navigate(['/card/home']);
  }

  cancel() {
    this.router.navigate(['/card/number']);
  }

}