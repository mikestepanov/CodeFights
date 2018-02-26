const firstDuplicate = (arr) => {
  for (let num of arr) {
    arr[Math.abs(num) - 1] *= -1;
    if (arr[Math.abs(num) - 1] > 0) {
      return Math.abs(num);
    }
  }
  return -1;
};

// O(n) time complexity
// O(1) space complexity
