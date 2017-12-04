class Stack {
  constructor() {
    this.store = [];
  }

  push(el) {
    this.store.push(el);
    return el;
  }

  pop() {
    if (this.store.length === 0) {
      throw "can't pop empty stack";
    }
    return this.store.pop();
  }

  length() {
    return this.store.length;
  }
}

module.exports = Stack;
