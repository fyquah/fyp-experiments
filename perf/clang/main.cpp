#include <iostream>

int
add(int a, int b)
{
  return a + b;
}

int
factorial(int N)
{
  if (N <= 0) {
    return 1;
  } else if (N <= 3) {
    return 2;
  } else {
    return add(N, add(1, 2));
  }
}

int
main ()
{
  for (int i = 0 ; i < 4000000 ; i++) {
    factorial(1000);
  }
  return 0;
}
