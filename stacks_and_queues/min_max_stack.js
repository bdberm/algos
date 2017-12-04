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
      const stackTop = this.stack[stackLength - 1];
      if(el > stackTop["max"]) {
        [elWithMinMax["max"], elWithMinMax["min"]] = [el, stackTop["min"]];

      } else if (el < stackTop["min"]) {
        [elWithMinMax["max"], elWithMinMax["min"]] = [stackTop["max"], el];
      } else {
        [elWithMinMax["max"], elWithMinMax["min"]] = [stackTop["max"], stackTop["max"]];
      }
    }
    this.stack.push(elWithMinMax);
  }

  pop() {
    return this.stack.pop();
  }

  max() {
    return this.stack[this.stack.length() - 1]["max"];
  }

  min() {
    return this.stack[this.stack.length() - 1]["min"];
  }

}

const myMinMax = new MinMaxStack();
