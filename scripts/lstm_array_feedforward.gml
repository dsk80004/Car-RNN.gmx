///lstm_array_feedforward()

//this version tries to mimic the use of vector math by using arrays

//Reference Video:  https://www.youtube.com/watch?v=8HyCNIVRbSU&list=PLPVQ5NVokFdRulZElCQI_lAptMliO7ODd&index=4&t=0s

//LSTM Cell
    var prev_output = 1;
    var prev_cell_state = 1;
    for(var i=0; i<ds_list_size(neurons); i++){
        
        //clear arrays
        var sigmoid_gates = 0;
//        var input_gate_output = 0;
        neurons[| i] = 0;
        //cell_state[i, j] = 0;
        
        for(var j=0; j<ds_list_size(inputs); j++){
            var input = ds_list_find_value(inputs,j);
            //make sure to delete the list when finished
            
//            show_debug_message("input"+string(input))
            
//Forget Gate
            sigmoid_gates = array_add(input,prev_output);
            sigmoid_gates = sigmoid(sigmoid_gates);
            
//            show_debug_message("prev_output"+string(prev_output))
//            show_debug_message("array_add(input,prev_output) = "+string(array_add(input,prev_output)))
//            show_debug_message("sigmoid_gates"+string(sigmoid_gates))
//Input Gate
//this is the same thing as the forget gate so we use the value sigmoid gates to cut down on calculations
            //input_gate_output = input+prev_output;
            //input_gate_output = sigmoid(input_gate_output)
            
//Candidate Gate            
            var candidate = 0;
            candidate = array_add(input,prev_output);
            candidate = tanh(candidate)
//            show_debug_message("candidate"+string(candidate))
            
//Cell State
            cell_state[# i, j] =  array_add(array_multiply_real(sigmoid_gates,candidate) , array_multiply_real(sigmoid_gates,prev_cell_state))
//            show_debug_message("cell_state[# i, j]"+string(cell_state[# i, j]))
//LSTM Output Gate
            neurons[| i] = array_add(array_multiply_real(input,(array_multiply_real(sigmoid_gates,tanh(cell_state[# i, j])))), neurons[| i]);
//            show_debug_message("neurons[| i]"+string(neurons[| i]))
//Set the previous outputs            
            prev_cell_state = cell_state[# i, j];
            prev_output = weights[i, j];
            
        }
        
        //Activation function
        neurons[| i] = tanh(neurons[| i])
//        show_debug_message("FINAL neurons[| i]"+string(neurons[| i]))
    }
    
    
    
        
//Output Nodes   
    for(var i=0; i<ds_list_size(outputs); i++){
        output = 0;
        for(var j=0; j<ds_list_size(neurons); j++){
            output = array_add(array_multiply_real(neurons[| j],output_weights[i, j]), output);
        }
        
        //Activation function
        output = tanh(output);
        outputs[| i] = output;
//        show_debug_message("output = "+string(output))
    }





