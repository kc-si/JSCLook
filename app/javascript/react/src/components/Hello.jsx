import React from 'react';
import ReactDOM from 'react-dom';
import { createRoot } from 'react-dom/client';

const Hello = () => {
  return (<div>Hello, Rails 7!</div>)
}

const root = createRoot(document.getElementById('hello'));
root.render(<Hello />);

export default Hello
