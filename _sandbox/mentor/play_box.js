
var foo = 'bar';

function hello () {
  foo; // bar
  function goodbye () {
    foo; // bar
  }
}

function example () {
  var bar = 'baz';
}

function example () {
  var bar = 'qux';
}

bar; // undefined
