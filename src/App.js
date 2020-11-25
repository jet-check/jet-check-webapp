import "./App.css";
import "bootstrap/dist/css/bootstrap.min.css";
import { JetCheckNavbar } from "./components/JetCheckNavbar";
import { Produktliste } from "./components/Produktliste";
import { Home } from "./components/Home";
import { BrowserRouter as Router, Switch, Route, Link } from "react-router-dom";

const App = () => {
  return (
    <JetCheckNavbar />
  );
};

export default App;
