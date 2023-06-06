function output = start(id, args)
    % Handle input to the server, including state management
    fprintf("Received input from ID: %d\n", id)
    
    if isfile("data.mat")
        load data.mat ppts
        
        % Check if the participant has existing data
        if isKey(ppts, id)
            fprintf("Participant %d has existing data\n", id)
        else
            fprintf("Participant %d is unknown, adding data\n", id)
            ppts(id) = [];
        end
    else
        % Create new data structure if file does not exist
        ppt_ids = { id };
        ppt_data = { [args(1)] };
        ppts = containers.Map(ppt_ids,ppt_data,'UniformValues',false);
    end

    % Get the output from the modeling function
    model_output = compute_function(id, args);
    
    % Get the existing data and update it to include the modeling output
    e_ppt_data = ppts(id);
    ppts(id) = [e_ppt_data; model_output(2)];
    
    % Save updated data
    save data.mat ppts
    
    % Return value to task
    output = sum(ppts(id));

