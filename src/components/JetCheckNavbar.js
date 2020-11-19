import React, { Component } from "react";
import * as ReactBootStrap from "react-bootstrap";
import "bootstrap/dist/css/bootstrap.min.css";

export class JetCheckNavbar extends Component {
  render() {
    return (
      <>
        <ReactBootStrap.Navbar
          collapseOnSelect
          expand="xl"
          bg="dark"
          variant="dark"
          fixed="top"
        >
          <ReactBootStrap.Navbar.Brand href="#home">
            Jet-Check
          </ReactBootStrap.Navbar.Brand>
          <ReactBootStrap.Navbar.Toggle aria-controls="responsive-navbar-nav" />
          <ReactBootStrap.Navbar.Collapse id="responsive-navbar-nav">
            <ReactBootStrap.Nav className="mr-auto">
              <ReactBootStrap.Nav.Link href="#Produkte">
                Produkte
              </ReactBootStrap.Nav.Link>
              <ReactBootStrap.Nav.Link href="#Passwort">
                Passwort
              </ReactBootStrap.Nav.Link>
              <ReactBootStrap.Nav.Link href="#Barcodescanner">
                Barcodescanner
              </ReactBootStrap.Nav.Link>
            </ReactBootStrap.Nav>
            <ReactBootStrap.Nav>
              <ReactBootStrap.Nav.Link href="#deets">
                More deets
              </ReactBootStrap.Nav.Link>
              <ReactBootStrap.Nav.Link eventKey={2} href="#memes">
                Dank memes
              </ReactBootStrap.Nav.Link>
            </ReactBootStrap.Nav>
          </ReactBootStrap.Navbar.Collapse>
        </ReactBootStrap.Navbar>
      </>
    );
  }
}
