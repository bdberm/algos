//Construct a queue using two myStackSet

const Stack = require("./stack");

class QueueOfStacks {
  constructor() {
    this.enqueueStack = new Stack();
    this.dequeueStack = new Stack();
  }

  length() {
    return (this.enqueueStack.length() + this.dequeueStack.length());
  }

  enqueue(el) {
    this.enqueueStack.push(el);
    return el;
  }

  flipStack() {
    while (this.enqueueStack.length() > 0) {
      this.dequeueStack.push(this.enqueueStack.pop());
    }
  }

  dequeue() {
    if (this.length() === 0) {
      throw "can't dequeue empty queue";
    }
    if (this.dequeueStack.length() === 0) {
      this.flipStack();
    }
    return this.dequeueStack.pop();
  }

  peek() {
    if (this.length() === 0) {
      throw "can't peek empty queue";
    }
    if (this.dequeueStack.length() === 0) {
      this.flipStack();
    }
    return this.dequeueStack.peek();
  }
}


const myQueue = new QueueOfStacks();

myQueue.enqueue(1);
console.log(myQueue.dequeue() === 1);
myQueue.enqueue(1);
myQueue.enqueue(2);
myQueue.enqueue(3);
console.log(myQueue.dequeue() === 1);
console.log(myQueue.dequeue() === 2);
myQueue.enqueue(4);
myQueue.enqueue(5);
console.log(myQueue.dequeue() === 3);
console.log(myQueue.dequeue() === 4);
console.log(myQueue.length() === 1);
