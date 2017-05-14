'use strict';

var _ReactDOM = ReactDOM,
    render = _ReactDOM.render;


render(React.createElement(
    'h1',
    { id: 'title',
        className: 'header',
        style: { backgroundColor: 'orange', color: 'white', fontFamily: 'verdana' } },
    'Hello World'
), document.getElementById('react-container'));

// const title = React.createElement(
//   'h1',
//   {id: 'title', className: 'header'},
//   'Hello World'
// )

// ReactDOM.render(
//   title,
//   document.getElementById('react-container'))
