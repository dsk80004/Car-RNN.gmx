///lstm_initialize()

//Weights for hidden layer
    for(var i=0; i<hidden_layer; i++){       
        for(var j=0; j<input_layer; j++){
            weights[i, j] = 1//random_range(-1, 1);
        }
    }
    
//Weights for output
    for(var i=0; i<output_layer; i++){      
        for(var j=0; j<hidden_layer; j++){
            output_weights[i, j] = 1//random_range(-1, 1);
        }
    }  

