import React from 'react';
import ReactDOM from 'react-dom';
import { createRoot } from 'react-dom/client';

class Welcome extends React.Component {
  render() {
    return (
      <div>
        <h1>Witaj!</h1>
      </div>
    );
  }
}

const root = createRoot(document.getElementById("welcome"));
root.render(<Welcome />);

export default Welcome;
