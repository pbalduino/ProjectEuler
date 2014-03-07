// http://projecteuler.net/problem=2

var sum = 0
  , before = 1
  , now = 1
;

while (now < 4000000) {
  before = now;
  now = now + before;

  if (now % 2 === 0) {
    sum += now;
  }
}

console.log(sum);
