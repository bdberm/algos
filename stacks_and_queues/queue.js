class Queue {
  constructor() {
    this.store = [];
  }

  enqueue(el) {
    this.store.unshift(el);
  }

  dequeue() {
    if (this.store.length === 0) {
      throw "can't dequeue empty queue";
    }
    return this.store.pop();
  }
}

module.exports = Queue;
