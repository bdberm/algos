class Stack {
  constructor() {
    this.store = [];
  }

  push(el) {
    this.store.push(el);
  }

  pop() {
    if (this.store.length === 0) {
      throw "can't pop empty stack";
    }
    return this.store.pop();
  }
}

module.exports = Stack;
