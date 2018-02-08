load A1;

experiment_record = [];
for first_layer_unit = 1:100
    for second_layer_unit = 1:100
        for regularizerWeight = [0.1:0.1:1]
            [net,valErr] = p10a(X_train,Y_train, [first_layer_unit, second_layer_unit], regularizerWeight);
            experiment_record = [experiment_record; [first_layer_unit, second_layer_unit, regularizerWeight, valErr]];
        end
    end
end

fprintf("the parameters with min validation error is:\n H=[%f, %f]\nregularizerWeight=%f\nvalidation error=%f\n", experiment_record(find(experiment_record(:,4) == min(experiment_record(:,4))), :));