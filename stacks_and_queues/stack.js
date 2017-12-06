class Stack {
  constructor(elements=[]) {
    this.store = elements;
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

  peek() {
    if (this.store.length !== 0) {
      return this.store[this.store.length-1];
    } else {
      return null;
    }

  }

  length() {
    return this.store.length;
  }
}

module.exports = Stack;
