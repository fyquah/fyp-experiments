#include <stdio.h>
#include <caml/mlvalues.h>
#include <caml/alloc.h>
#include <caml/custom.h>

value caml_print_int_native(value x)
{
  const int s = Int_val(x);
  printf("%d\n", s);
  return (Val_unit);
}
