import React, { Component } from "react";
import Passworteingabe from "./Passworteingabe";

export class Home extends Component {
  render() {
    return (
      <Button variant="primary" onClick={() => setModalShow(true)}>
        Test Login
      </Button>
    );
  }
}
