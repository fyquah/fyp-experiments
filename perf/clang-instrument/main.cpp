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
    return N * factorial(N - 1);
  }
}

int
main ()
{
  for (int i = 0 ; i < 1000 ; i++) {
    factorial(1000);
  }
  return 0;
}
