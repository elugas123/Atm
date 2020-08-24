import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-error',
  templateUrl: './error.component.html',
  styleUrls: ['./error.component.css']
})
export class ErrorComponent implements OnInit {

  constructor(private route: ActivatedRoute) { }

  mensaje = ""

  ngOnInit(): void {
    this.route.queryParams.subscribe(params => {
      this.mensaje = params['mensaje'];
    });
  }

}
