//Function that returns a sorted copy of a stack such that the smallest items are on the top.
//CONSTRAINT: You can use one additiona temporary stack but may not copy
//elements into any other data structure (such as array).

const Stack = require("./stack");

function sortStack(stack) {
  const sortedStack = new Stack();
  let holdEl;

  if (stack.isEmpty()) {return sortedStack;}

  while (!stack.isEmpty()) {
    if (sortedStack.isEmpty() || stack.peek() < sortedStack.peek()) {
      sortedStack.push(stack.pop());
    } else {
      holdEl = stack.pop();
      while (sortedStack.peek() < holdEl) {
        stack.push(sortedStack.pop());
      }
      sortedStack.push(holdEl);
    }
  }
  return sortedStack;
}

const myStack = new Stack();
myStack.push(3);
myStack.push(2);
myStack.push(1);
myStack.push(4);
myStack.push(5);

const sortedStack = sortStack(myStack);
console.log(sortedStack.pop() === 1);
console.log(sortedStack.pop() === 2);
console.log(sortedStack.pop() === 3);
console.log(sortedStack.pop() === 4);
console.log(sortedStack.pop() === 5);
console.log(sortedStack.isEmpty());
