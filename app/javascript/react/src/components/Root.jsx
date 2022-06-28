import React from 'react';
import ReactDOM from 'react-dom';
import { createRoot } from 'react-dom/client';

class Root extends React.Component {
  render() {
    return (
      <div>
        <h1>Hello, Rails 7!</h1>
      </div>
    );
  }
}

const root = createRoot(document.getElementById('root'));
root.render(<Root />);

export default Root
