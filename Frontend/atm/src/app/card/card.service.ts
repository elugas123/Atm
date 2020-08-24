import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';

@Injectable({ providedIn: 'root' })
export class CardService {

  private validateCardURL = 'https://localhost:44354/api/Tarjetas/ValidarTarjeta';  // URL to web api
  private validatePINURL = 'https://localhost:44354/api/Tarjetas/ValidarPin';  // URL to web api
  private getBalance= 'https://localhost:44354/api/Operacions/Tarjeta/';
  private saveOperacion= 'https://localhost:44354/api/Operacions';
  httpOptions = {
    headers: new HttpHeaders({ 'Content-Type': 'application/json' })
  };

  constructor(
    private http: HttpClient) { }

  /** POST: add a new hero to the server */
  validateCard(card_number: string): any {
    return this.http.post(this.validateCardURL, {"NumeroTarjeta": card_number.replace(/-/g,"")}, this.httpOptions);
  }
  validatePIN(card: string): any {
    return this.http.post(this.validatePINURL, {"Pin": card,"Id": localStorage.getItem('id')}, this.httpOptions);
  }



  saveOperation(operation: any): any {
    return this.http.post(this.saveOperacion, {
      "TarjetaId": localStorage.getItem("id"),
      "tipoOperacionId": operation.tipoOperacionId,
      "cantidad": operation.cantidad
    }, this.httpOptions);
  }

  getAccountDetail(card_id: any): any {
     return this.http.get(this.getBalance+card_id,this.httpOptions);
  
  }

}