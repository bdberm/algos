//Implement a set of stacks. Given a constraint of max stack size, a new
//stack should be created once the current stack is filled to capacity.
//Push and pop should work identically to a stack

const Stack = require("./stack");

class SetOfStacks {
  constructor(maxStackSize) {
    this.stackCapacity = maxStackSize;
    this.stacks = new Stack([]);
  }

  numStacks() {
    return this.stacks.length();
  }

  push(el) {
    const lastStack = this.stacks.peek();

    if (lastStack === null || lastStack.length() === this.stackCapacity) {
      this.stacks.push(new Stack([el]));
    } else {
      this.stacks.peek().push(el);
    }
    return el;
  }

  pop() {

    let popEl = this.stacks.peek().pop();
    if (this.stacks.peek().length() === 0) {
      this.stacks.pop();
    }
    return popEl;
  }

  peek() {
    return this.stacks.peek().peek();
  }


}

const myStackSet = new SetOfStacks(3);

myStackSet.push(1);
console.log(myStackSet.peek() === 1);
myStackSet.push(2);
myStackSet.push(3);
console.log(myStackSet.peek() === 3);
console.log(myStackSet.numStacks() === 1);
myStackSet.push(4);
console.log(myStackSet.peek() === 4);
console.log(myStackSet.numStacks() === 2);
myStackSet.push(5);
myStackSet.push(6);
console.log(myStackSet.peek() === 6);
console.log(myStackSet.numStacks() === 2);
myStackSet.push(7);
console.log(myStackSet.peek() === 7);
console.log(myStackSet.numStacks() === 3);
myStackSet.pop();
console.log(myStackSet.peek() === 6);
console.log(myStackSet.numStacks() === 2);
