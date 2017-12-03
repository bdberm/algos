function rotateSquareArray(arr) {
  for(outer=0; outer< arr.length/2; outer++) {
    const oppOuter = arr.length - 1 - outer;
    for(inner=outer; inner < arr.length-outer-1; inner++) {
      const oppInner = arr.length - 1 - inner;
      const [top, right, bottom, left] = 
      [arr[outer][inner], arr[inner][oppOuter], arr[oppOuter][oppInner], arr[oppInner][outer]];
       [arr[outer][inner], arr[inner][oppOuter], arr[oppOuter][oppInner], arr[oppInner][outer]] = [left, top, right, bottom]
    }
  }
  return arr
}

// function checkSquareMatrix(matrix, otherMatrix) {
//   for(i=0; i< matrix.length; i++) {
//     for (j=0; j< matrix.length; j++) {
//       if (matrix[i][j] != otherMatrix[i][j]) {
//         return false;  
//       }
//     }
//   }
//   return true;
// }
// 
// myArr =[[1,2,3,4],
//         [5,6,7,8],
//         [9,10,11,12],
//         [13,14,15,16]]
// 
// rotate = [[13,9,5,1],
//           [14,10,6,2],
//           [15,11,7,3],
//           [16,12,8,4]]
// 
// console.log("Properly Rotates 4x4?")
// 
// console.log(checkSquareMatrix(rotate, rotateSquareArray(myArr)))


