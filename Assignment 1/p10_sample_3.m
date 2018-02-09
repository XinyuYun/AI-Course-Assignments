load A1;

experiment_record = [];
for first_layer_unit = [200:-10:10]
    top = 10;
    if(first_layer_unit > 10)
        top = first_layer_unit;
    end
    for second_layer_unit = [10: 10 : top]
        for regularizerWeight = [0.1:0.1:0.9]
            [net,valErr] = p10a(X_train,Y_train, [first_layer_unit, second_layer_unit], regularizerWeight);
            experiment_record = [experiment_record; [first_layer_unit, second_layer_unit, regularizerWeight, valErr]];
        end
    end
end

fprintf("the parameters with min validation error is:\n H=[%f, %f]\nregularizerWeight=%f\nvalidation error=%f\n", );