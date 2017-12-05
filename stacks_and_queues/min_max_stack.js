//Stack that has a O(1) max and min peek functionality

const Stack = require("./stack");

class MinMaxStack {
  constructor() {
    this.stack = new Stack();
  }

  push(el) {
    const stackLength = this.stack.length();

    const elWithMinMax = {"el": el};
    if (stackLength === 0) {
      [elWithMinMax["max"], elWithMinMax["min"]] = [el, el];
    } else {
      const stackTop = this.stack.store[stackLength - 1];
      if(el > stackTop["max"]) {
        [elWithMinMax["max"], elWithMinMax["min"]] = [el, stackTop["min"]];

      } else if (el < stackTop["min"]) {
        [elWithMinMax["max"], elWithMinMax["min"]] = [stackTop["max"], el];
      } else {
        [elWithMinMax["max"], elWithMinMax["min"]] = [stackTop["max"], stackTop["min"]];
      }
    }
    this.stack.push(elWithMinMax);
  }

  pop() {
    return this.stack.pop();
  }

  max() {
    if (this.stack.length() === 0) {
      return null;
    }
    return this.stack.store[this.stack.length() - 1]["max"];
  }

  min() {
    if (this.stack.length() === 0) {
      return null;
    }
    return this.stack.store[this.stack.length() - 1]["min"];
  }

}

//Tests

// const myMinMax = new MinMaxStack;
//
// myMinMax.push(2);
// myMinMax.push(2);
// myMinMax.push(4);
// myMinMax.push(6);
// myMinMax.push(4);
// myMinMax.push(6);
// myMinMax.push(1);
// myMinMax.push(2);
// myMinMax.push(1);
//
// //max is 6 min is 1
// console.log(myMinMax.max() === 6);
// console.log(myMinMax.min() === 1);
//
// myMinMax.pop();
// //max is 6 min is 1
// console.log(myMinMax.max() === 6);
// console.log(myMinMax.min() === 1);
//
// myMinMax.pop();
// myMinMax.pop();
// console.log(myMinMax.max() === 6);
// console.log(myMinMax.min() === 2);
//
// myMinMax.pop();
// myMinMax.pop();
// myMinMax.pop();
// console.log(myMinMax.max() === 4);
// console.log(myMinMax.min() === 2);
