///array_multiply_real(array1, value)

/// Both arays must be the same size. [2,2] * [2,2] for example

///   although it is possible to multiply a [2,3]*[3,2] The script may not support this (we'll see)

// [value] can be either a real value or an array

var a1 = argument0,
    a2 = argument1,
    final_array;
//show_debug_message("a1 = "+string(a1))
//show_debug_message("a2 = "+string(a2))
if is_array(a2){
  ///for each cell in the final array
  for (var i = 0; i < array_length_2d(a1,0); i++){
    for (var j = 0; j < array_height_2d(a1); j++){
      // initialize the cell
      final_array[j,i] = a1[j,i] * a2[j,i];
    }
  }
  return final_array
}

if is_real(a2){
  ///for each cell in the final array
  for (var i = 0; i < array_length_2d(a1,0); i++){
    for (var j = 0; j < array_height_2d(a1); j++){
      // initialize the cell
      final_array[j,i] = a1[j,i] * a2;
    }
  }
  return final_array
}




