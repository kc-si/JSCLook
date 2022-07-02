import React from 'react';
import ReactDOM from 'react-dom';

class SearchBar extends React.Component {
  constructor(props) {
    super(props);
    this.handleChange = this.handleChange.bind(this);
  }

  handleChange(event) {
    this.props.onValueChange(event.target.value);
  }

  render() {
    const value = this.props.value;
    const placeholder = this.props.placeholder;
    return (
      <form>
        <input type="text" placeholder={placeholder} value={value} onChange={this.handleChange}>
        </input>
      </form>
    );
  }
}
export default SearchBar
