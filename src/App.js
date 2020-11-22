import "./App.css";
import "bootstrap/dist/css/bootstrap.min.css";
import { JetCheckNavbar } from "./components/JetCheckNavbar";
import { Passworteingabe } from "./components/Passworteingabe";

const App = () => {
  const [modalShow, setModalShow] = React.useState(false);
  
  return (
    <div className="container">
      <JetCheckNavbar />
    </div>
  );
};

export default App;
